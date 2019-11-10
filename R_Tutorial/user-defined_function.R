# Create a function without an argument.
new.function <- function() {
	for(i in 1:5) {
		print(i^2)
	}
}

# Call the function without supplying an argument
new.function()
