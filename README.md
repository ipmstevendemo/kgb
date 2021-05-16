# Kgb

## Installation

```bash
bundle install
````

## Usage

```
bin/kgb dealership reviews --dealer-name="McKaig Chevrolet Buick"
```
### Sample output
```
####################################################
Searching Dealer with name: McKaig Chevrolet Buick
####################################################
Found Dealer: McKaig Chevrolet Buick - A Dealer For The People
Fetching reviews for first 5 pages
Fetched reviews for first 5 pages, got 50 reviews
Start reviews analysis
Finished reviews analysis
printing 3 overly positive
-----------------------------------------------------------------------------
- Score: 4.902083333333  Review: I will purchase all of my future vehicles from McKaig Chevrolet Buick. My most recent purchase was a 2021 Chevrolet Silverado. Everyone who was involved was extremely helpful. Freddie Tomlinson was instrumental in suggesting which vehicle would suit my needs. Dennis Smith was extremely helpful with the sales process and Taylor was very detailed in explaining the Financing part of the transaction. The service here was awesome and the transaction was extremely smooth and easy.
- Score: 4.138621794872  Review: I loved working with the staff at McKaig because everyone was so nice and friendly. They made me feel right at home! They were able to get me in a nice vehicle and I am completely satisfied. They really are a dealer FOR the people.
- Score: 3.322916666667  Review: Dennis was very nice and helpful. I told him that I only wanted one certain car & I left the lot with that car. They were very busy, but he remained positive & had great customer service. I was so pleased that I referred a friend & she also got a new whip! Awesome people :) Summer was very helpful. & Taylor was nice.
-----------------------------------------------------------------------------
```


## How to run test

```bash
bundle exec rake test
```

## Criteria of endorsement score

- There are two sentiment data files added, each has a word and its associated sentiment score, like(`0.75` => `awesome`, `-0.21875` => `cry`).
- To calculate the sentiment score of a review, we first tokenize the review sentence and then calculate the sum of score for each token based on the mapping from sentiment data files. 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
