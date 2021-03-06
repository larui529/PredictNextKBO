## Predicting the next word from a series of prior words using a Katz Backoff Trigram language model
The goal of this project was to build a data product which uses a Katz Backoff Trigram language model to predict the next word from a series of prior words.  This is implemented as a Shiny R web application accessible from the following link:

<span>&nbsp;&nbsp;</span><a href=https://michael-szczepaniak.shinyapps.io/predictnextword/>https://michael-szczepaniak.shinyapps.io/predictnextkbo/</a>

Pre-process input filtering is not in place yet, but the model appears to be functioning as expected.

### Project Breakdown
The project is broken down in to four parts described below.  Each part contains a link to a page on rpubs which describes that part in further detail.  If there is no link at the top of a section, it has not been completed yet:
<ol style="list-style-type: decimal">
<li><a href=http://rpubs.com/mszczepaniak/predictkbo1preproc>Part 1 - Overview and Pre-Processing</a></li>
This main goal of this part was to convert the raw corpus data into a form which could be easily utilized by the next step in building n-gram tables and perform exploratory data analysis (EDA).
  <ul>
  <li>Background</li>
  <li>Project Objectives</li>
  <li>Acquiring, Partitioning, Preparing the Data
    <ul>
      <li>Sentence Parsing</li>
      <li>Non-ASCII Character Filtering</li>
      <li>Unicode Tag Conversions and Filtering</li>
      <li>URL Filtering</li>
      <li>Additional Filtering and EOS Tokenization</li>
    </ul>
  </li>
  </ul>
<li><a href=http://rpubs.com/mszczepaniak/predictkbo2ngeda>Part 2 - N-grams and Exploratory Data Analysis</a></li>
The main goal of this part was to construct the n-gram tables which will be used by the language model and do some exploratory analysis on the cleaned up data.
  <ul>
    <li>Unigram Singleton Processing</li>
    <li>Unigram, Bigram, and Trigram Frequency Table Generation</li>
    <li>Count of Counts plots</li>
    <li>Top 10 Unigram, Bigram, and Trigram Frequency Plots</li>
  </ul>
<li><a href=http://rpubs.com/mszczepaniak/predictkbo3model>Part 3 - Understanding and Implementing the Model</a></li>
The main goal of this part was to develop the conceptual framework and the code to implement the Katz Backoff Trigram algorithm as the model used to predict the next word.
  <ul>
  <li>Deriving the Model
    <ul>
      <li>Maximum Likelihood Estimate</li>
      <li>Markov Assumption</li>
      <li>Discounting</li>
      <li>Probabiltities of Observed N-grams</li>
      <li>Probabiltities of Unobserved N-grams</li>
    </ul>
  </li>
  <li>Walk-through of the KBO Trigram Algorithm Calculations</li>
  </ul>
<li><a href=http://rpubs.com/mszczepaniak/predictkbo4cv>Part 4 - Parameter Selection and Optimization</a></li>
At the end of Part 3, we had developed the ideas and the algorithm needed to make predictions, but generic values were used for the two parameters of the model: the bigram discount rate and trigram discount rate.  In this last part of this series, we'll use cross-validation to determine values for these discount rates to improve the accuracy of the model.
