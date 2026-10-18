# Portfolio 4: Personal Learning Reflection

**Course:** MIT8103 - Advanced Database Systems  
**Case Study:** NaijaOpenLearner Online Store

## What I Learned

This practical exercise helped me understand how MongoDB stores information in documents rather than traditional relational tables.

I learned that different products can be stored in the same collection even when they have different characteristics. For example, a textbook can contain information about its author and reading level, while a calculator can contain information about its battery and warranty.

MongoDB allowed me to store the common product details alongside their individual characteristics inside an `attributes` object.

## Most Useful Practical Exercise

The exercise that taught me the most was querying nested fields.

When I searched for products using `attributes.skill_level`, MongoDB successfully returned the Networking Study Kit.

This helped me understand that flexible document structures do not prevent us from searching for specific information. I also learned how MongoDB uses dot notation to access fields inside embedded objects.

## Application to NaijaOpenLearner Online Store

If I were developing NaijaOpenLearner Online Store, I would consider using MongoDB for the product catalogue because textbooks, calculators and learning kits have different attributes.

For orders and payments, I would prefer PostgreSQL because its foreign keys, constraints and transaction controls can help maintain accurate relationships and data consistency.

However, I understand that using two database systems introduces additional responsibilities. I would need to maintain consistent product identifiers, coordinate data between the databases and manage both systems.

I also learned that consistent field naming matters in MongoDB because queries depend on the field paths used in the documents.

## Final Reflection

The main lesson I gained from this practical is that choosing a database depends on the information being stored and how the business intends to use it.

MongoDB offers flexibility for varied product information, while PostgreSQL provides relational integrity features that are useful for transactional operations.

Both databases have strengths, and the most suitable choice should depend on the application's requirements.
