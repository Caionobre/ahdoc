module DocumentsHelper
  def actors_for_select(group)
    group.actors.map{|actor| [actor.name, actor.id]}
  end
end
