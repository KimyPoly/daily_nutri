class Chatgpt
  def initialize(options)
    initialize_chat
    @diet = options[:diet] || "Vegan"
    @goal = options[:goal] || "lose weight"
    @allergies = options[:allergies] || "Crusta"
    @number_of_meals = options[:number_of_meals] || 3
    @number_of_days = options[:number_of_days ] || 2
    @number_of_collations = options[:number_of_collations ] || 0
    @height = options[:height ] || 160
    @weight = options[:weight] || 60
  end

  def search_meals
    prompt = meal_prompt
    answer = chat(prompt)
    result = answer.dig("choices")[0].dig("message","content")
    p result
    result
  end

  private

  def provide_calendar
  end

  def initialize_chat
    @client ||= OpenAI::Client.new(request_timeout: 240)
  end

  def meal_prompt
    format = "I need you to generate recipes. I need your answer to respect a certain format. Like this : \n
    @@ name @@ @@@ Recipe's name @@@ \n
    @@ Calories @@ @@@ how many calories @@@ \n
    @@ Type @@ @@@ what type of meal is it @@@ \n
    @@ Time @@ @@@ how long does it take to cook @@@ \n
    @@ Price @@ @@@ how much does it cost approximately @@@ \n
    @@ Ingredients @@ @@@ first ingredient, second ingredient, etc. @@@ \n
    @@ Recipe @@ @@@ the recipe itself @@@"

    if @allergies
    allergies = "my allergies are #{@allergies}"
    else
      allergies = "I dont have allergies"
    end

    request = "here is what i need. My weight is #{@weight}kg, my height is #{@height} cm, \n
    my diet is #{@diet}, #{allergies}, my goal is to #{@goal}. \n
    please generate #{how_much_meals} recipes "

    combined = format + request
    p combined
    combined
  end

  def how_much_meals
    (@number_of_days * @number_of_meals) *2
  end

  def chat(prompt)
    @client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: prompt}],
          temperature: 0.7,
      })
  end
end
