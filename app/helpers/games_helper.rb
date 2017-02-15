module GamesHelper
  def short_member_name(name)
    words =  name.split(' ')
    [words[0],words[1][0]].join(' ') + '. '
  end
end
