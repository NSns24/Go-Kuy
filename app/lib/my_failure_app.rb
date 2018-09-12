class MyFailureApp < Devise::FailureApp
  	def route(scope)
       scope.to_sym == :user ? :new_user_session_path : super
       scope.to_sym == :driver ? :new_driver_session_path : super
       scope.to_sym == :admin ? :root_path : super


	end

    # You need to override respond to eliminate recall
    def respond
      if http_auth?
        http_auth
      else
        redirect
      end
    end
end


