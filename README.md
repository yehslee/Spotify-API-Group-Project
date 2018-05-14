# INFO 201 Final Project Proposal: Youtube's API
By: Chris Vitalis, Yeh-Sun Lee, Alvin Tran, JoJo Saunders

## Project Description
The goal of this project is to work with the [Youtube API](https://www.googleapis.com/youtube/v3/channels) and the [World Demographic API](https://restcountries.eu/rest/v2/all) to be able to understand the demographics and population distribution among popular creators on Youtube. The data is collected by Youtube itself, from the users and subscribers of the various accounts. 

**Who is your Target Audience**
Our target audience is anyone interested in how popular some youtubers are. It
can be a big hit of reality when you consider that some youtubers have more
subscribers than some countries have people. For example, the biggest youtuber,
Pewdiepie, has over 60 million subs, which is more than the population of
South Korea. The target audience can also be those who aren't fully aware of the
impact and volume that is Social Media.
Three questions this will answer are:
- How much influence do youtubers have (from their size)?
- Which youtuber has the biggest impact (from their size)?
- How much political impact do youtubers have due to their following?



## Technical Description
**How will We Be Reading in Our Data?**

We will be using both Youtube's API and an API on Country population in order to be able to understand both the demographics of the countries but how they also link up to Youtube Creator's subscriber Demographics.

**What Type of Data Wrangling Will Need to Do?**

We'll need to find the data frames of relevant information, pertaining to a Creator's subscriber gender demographic, age demographic, and location demographic to be able to match it to the overall demographic of the country itself. These values can be stored in csv files but can be read in to do data analysis and visualization.

**What Libraries Will Be Used for this Project?**

We'll require the use of the _dplyr_ library for data wrangling, _ggplot2_ and _plotly_ for data visualization. We will also be using _shiny_ to help more with the construction of our final website, and more visualization and interactive uses. Other than those, we are currently looking at other libraries to further help with data visualizations and more aesthetics for our final project.

**What Major Challenges Do You Anticipate?**

One of the biggest challenges we'll face will be trying to analyze the information from Youtube's API into a manageable data frame in order to both visualize the data but also connect it to the world demographic's API, while also being able to display all the relevant information required to answer our questions. The data presented by Youtube is big scale data, so being able to filter down and create a dataset that will be useful, and easily understood will most likely be the most difficult aspect of the project.
