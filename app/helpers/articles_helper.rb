module ArticlesHelper
  def parent_tree id = 0, level = -1
     level += 1
     articles = []
     Article.select([:title,:id]).where(parent_id:id).map do |item|
         articles << ["- - " * level + item.title, item.id]
         parent_tree(item.id, level).map do |children|
           articles   <<  children
         end
     end
     articles
  end
end
