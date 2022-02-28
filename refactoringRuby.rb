# Zachary Bochanski

class Invoker
  
  def invoke=(command)
    @command = command
  end

  def do
    @command.execute
  end
end

class Command
  
  def initialize(task, information)
    @task = task
    @information = information
  end

  def execute
    @information[@task].print_result
  end

end

class Word

  def initialize(count, message)
    @count = count
    @message = message
  end

  def print_result
    @count.times { puts @message }
  end

end

command_names = ["noun", "verb", "adjective", "adverb", "gerund"]
puts "Enter a command: #{command_names.join(" ")}"
selection = gets.chomp

grammer = { "noun" => Word.new(2, "Noun: Cadillac"),
            "verb" => Word.new(2, "Verb: Accelerate"),
            "adjective" => Word.new(3, "Adjective: Dark"),
            "adverb" => Word.new(2, "Adverb: Confidently"),
            "gerund" => Word.new(4, "Gerund: Grooving"),
          }

invoker = Invoker.new
invoker.invoke = Command.new(selection, grammer)
invoker.do
