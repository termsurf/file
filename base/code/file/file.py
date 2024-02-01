# Define the text to be replaced and the replacement text
text_to_replace = "Hello, World!"  # Replace with the text you want to replace
replacement_text = "Hello!"  # Replace with the text you want to insert

# Open the input file for reading
try:
    with open(input_file, "r") as file:
        file_contents = file.read()

    # Replace the text in the file contents
    modified_contents = file_contents.replace(text_to_replace, replacement_text)

    # Open the output file for writing
    with open(output_file, "w") as file:
        file.write(modified_contents)

    print("Text replaced successfully and written to", output_file)

except FileNotFoundError:
    print("Input file not found.")
except Exception as e:
    print("An error occurred:", str(e))
