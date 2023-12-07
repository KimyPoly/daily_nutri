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
        client = OpenAI::Client.new(request_timeout: 20)
        chaptgpt_response = client.chat(parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: "I have #{elements} left in my fridge, can you give me 1 recipe to do max 1000 charactere"}]
        })
        chaptgpt_response["choices"][0]["message"]["content"]
        rescue Faraday::Error => e
          "For Pasta with Tomato Sauce:
            Ingredients:

              8 ounces (about 225 grams) of your favorite pasta
              2 tablespoons olive oil
              1 small onion, finely chopped
              2 cloves garlic, minced
              1 can (14 ounces) crushed tomatoes
              1 teaspoon dried oregano
              1 teaspoon dried basil
              Salt and pepper to taste
              Pinch of red pepper flakes (optional, for a bit of heat)
              Freshly grated Parmesan cheese (optional, for serving)
              Fresh basil or parsley for garnish

              Instructions:

              Cook the pasta: Bring a large pot of salted water to a boil. Cook the pasta according to the package instructions until al dente. Drain and set aside.

              Prepare the sauce: In a large skillet, heat olive oil over medium heat. Add chopped onions and cook until they become translucent, about 3-4 minutes. Add minced garlic and cook for an additional 1-2 minutes until fragrant.

              Add tomatoes and spices: Pour in the crushed tomatoes, dried oregano, dried basil, salt, pepper, and red pepper flakes (if using). Stir well to combine. Simmer the sauce for about 10-15 minutes, allowing the flavors to meld and the sauce to thicken slightly.

              Combine pasta and sauce: Add the cooked pasta to the skillet with the tomato sauce. Toss the pasta until it's well coated with the sauce.

              Serve: Divide the pasta among plates. If desired, sprinkle with freshly grated Parmesan cheese and garnish with fresh basil or parsley."
        end
    end
end
