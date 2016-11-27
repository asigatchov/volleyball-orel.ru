
namespace :members do
    desc "Экспорт участников"
    task :export  => :environment do
      f = File.open('./tmp/trium.html')
      text =  f.read
      text.gsub(%r{<tr valign="top">.*?</tr>}m) do |line|
          t=0
          member={}
          line.gsub(%r{<td.*?>(.*?)</td>}m) do |td|
             if (t<3)
               member[{0=>:pos, 1=>:title, 2=> :birthday}[t]] = td.gsub(%r{<.*?>}, '').gsub(/\s+/, ' ').strip
             else
               if  td  =~ %r{<img.*?src="(.*?)"}
                member[:photo]  = File.open("./tmp/#{$1}")
              end
             end
             t+=1
          end
          member[:team_id]=6
          mb=  Member.new(member)
          mb.save
      end

    end

end
