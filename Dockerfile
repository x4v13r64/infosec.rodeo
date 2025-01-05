# Use an official Ruby 2.7 image as a base
FROM ruby:2.7

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock (if available) into the container
COPY Gemfile Gemfile.lock ./

# Install a compatible version of bundler
RUN gem install bundler -v 2.4.22 && bundle _2.4.22_ install

# Copy the rest of the project into the container
COPY . .

# Expose the port Jekyll will serve on
EXPOSE 4000

# Command to serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "--incremental", "--livereload", "--host", "0.0.0.0"]