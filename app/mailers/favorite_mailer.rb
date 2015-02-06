class FavoriteMailer < ActionMailer::Base  
  default from: "chris.fairchild@gmail.com"

  def new_comment(user, post, comment)
 
   # New Headers
   headers["Message-ID"] = "<comments/#{comment.id}@cbf-bloccit.example>"
   headers["In-Reply-To"] = "<post/#{post.id}@cbf.bloccit.example>"
   headers["References"] = "<post/#{post.id}@cbf-bloccit.example>"
 
   @user = user
   @post = post
   @comment = comment
 
   mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
