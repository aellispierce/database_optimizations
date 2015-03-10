# Database Optimizations

## Description

I was given an existing application which generates a report from a large data set and told to improve the efficiency of the report using database optimization methods.

## Stats:
* Initial Seeding: Completed running in 5095.56946 seconds
* Initial index page load time: ∞
* Add Indexes:
*   * add_index(:sequences, :assembly_id)
*   * -> 7.1009s
*   * add_index(:genes, :sequence_id)
*   * -> 27.3595s
*   * add_index(:hits, [:subject_id, :subject_type])
* -> 61.3447s
* Second Index page load attempt: 1.8minutes
* Percent Improvement: Not as much as I'd hoped.
* 3rd Index page load: 1.1minutes
* add_index(:assemblies, :name)
* -> 0.1337s
* 4th Index page load (after adding name index): 1.6minutes :/
* Second Seed: Completed running in 21812.635078 seconds
* Size of database (in bytes).
    * 572829696
* Size of development log.
    * 1471760480
* One example method for reducing the size of database yet keeping data intact:
  * Data compression can help reduce the size of your database. Columns that compress well are:
    * Columns with numeric or fixed-length character data types where most values don’t require all the allocated bytes: For example, integers where most values are less than 1000
    * Nullable columns where a significant number of the rows have a NULL value for the column
    * Significant amounts of repeating data values or repeating prefix values in the data
Is this smaller, about right, or larger than the size of databases you'll be working with in your career?
* Probably about right to smaller.
