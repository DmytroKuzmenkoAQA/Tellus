
# TellusAssessment

This project demonstrates how to test the GIPHY Search API using RSpec in Ruby, with a clean, maintainable, and production-ready structure.

## Features
- Giphy API client in `lib/giphy_client.rb`
- RSpec tests with best practices and context blocks
- Environment variable management with Dotenv
- Test coverage reporting with SimpleCov
- Linting with RuboCop
- GitHub Actions CI workflow

## Getting Started

### Prerequisites
- Ruby (3.0 or newer recommended)
- Bundler (`gem install bundler`)

### Setup
1. Install dependencies:
   ```sh
   bundle install
   ```
2. Copy the example environment file and add your GIPHY API key:
   ```sh
   cp .env.example .env
   # Edit .env and set GIPHY_API_KEY=your_real_key
   ```
3. Run the test suite:
   ```sh
   bundle exec rspec
   ```

### Viewing Test Coverage
After running the tests, open the coverage report:
```sh
open coverage/index.html
```

### Linting
Check code style with RuboCop:
```sh
bundle exec rubocop
```

## Project Structure
- `lib/` - Source code (Giphy client)
- `spec/` - RSpec tests
- `.github/workflows/` - CI configuration
- `.env.example` - Example environment variables
- `.rubocop.yml` - Linter configuration
- `Gemfile` - Ruby dependencies

## Contributing
1. Fork this repo and create your feature branch.
2. Commit your changes and open a pull request.
3. Ensure all tests and linters pass before submitting.

## Notes
- **Never commit your real `.env` file or API keys.**
- This project is for educational and demonstration purposes.
# Tellus