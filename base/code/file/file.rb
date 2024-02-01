# Define the input and output file names
input_file = "input.txt"  # Replace with the name of your input file
output_file = "output.txt"  # Replace with the name of your output file

# Define the text to be replaced and the replacement text
text_to_replace = "Hello, World!"  # Replace with the text you want to replace
replacement_text = "Hello, Ruby!"  # Replace with the text you want to insert

begin
  # Open the input file for reading
  File.open(input_file, "r") do |file|
    file_contents = file.read

    # Replace the text in the file contents
    modified_contents = file_contents.gsub(text_to_replace, replacement_text)

    # Open the output file for writing
    File.open(output_file, "w") do |output|
      output.write(modified_contents)
    end

    puts "Text replaced successfully and written to #{output_file}"
  end
rescue Errno::ENOENT
  puts "Input file not found."
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
