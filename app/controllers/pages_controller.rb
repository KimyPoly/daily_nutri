class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [:programs_dashboard]
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def programs_dashboard
    @user = current_user
    @programs = current_user.programs
    @program = Program.new
    if !params[:options].nil?
      @response_from_content_method = meal_with_content(params[:options])
    end
  end

  def meal_with_content(*elements)
    begin
        client = OpenAI::Client.new(request_timeout: 1)
        chaptgpt_response = client.chat(parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: "I have #{elements} left in my fridge, can you give me 1 recipe to do max 1000 charactere"}]
        })
        chaptgpt_response["choices"][0]["message"]["content"]
        rescue Faraday::Error => e
          "This is the recipe"
        end
    end
end
