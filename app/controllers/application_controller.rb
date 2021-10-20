class ApplicationController < ActionController::API
  SECRETS = 'BookAPIV1SecretKey000111$$&&'.freeze

  def token_header
    request.headers[:token]
  end

  def auth
    token = token_header
    if token
      decode_token = decrypt(token)
      user_id = decode_token[0]['user_id']
      user = User.find(user_id)
      if user.persent?
        user
      else
        render json: { error: 'Invalide token!' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Missing token!' }, status: :unprocessable_entity
    end
  end

  def current_user
    token = token_header
    if token
      decoded_token = decrypt(token)
      user_id = decoded_token[0]['user_id']
      User.find(user_id)
    end
  end

  def encrypt(payload)
    JWT.encode payload, SECRETS, 'HS256'
  end

  def decrypt(token)
    jwt.decode token, SECRETS, 'HS256'
  rescue StandardError => e
    e
  end
end
