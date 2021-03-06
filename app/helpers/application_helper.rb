module ApplicationHelper
  def my_name
    "Chris Fairchild"
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def down_vote_link_classes(post)
    base = "glyphicon glyphicon-chevron-down "
    vote = current_user.voted(post)
    base += "voted" if vote && vote.down_vote?
    base
  end

  def up_vote_link_classes(post)
    base = "glyphicon glyphicon-chevron-up "
    vote = current_user.voted(post)
    base += "voted" if vote && vote.up_vote?
    base
  end

end
