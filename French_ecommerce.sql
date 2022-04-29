
# -----------------------------PROJECT1 -SQL------------------------
#********************************************************************
#  --------------------------E-commerce database analyze--------------
#********************************************************************

# 1. Create new schema as ecommerce
create database ecommerce;
use ecommerce;

# 2 Import table;
show tables;

# 3.Run SQL command to see the structure of table
desc users_data;

#4.Run SQL command to select first 100 rows of the database
select * from users_data limit 100;

#5.How many distinct values exist in table for field country and language
select distinct country from users_data;
select distinct language from users_data;

#6.Check whether male users are having maximum followers or female users.
select gender,max(socialNbFollowers) from users_data group by gender;

#7.Calculate the total users those
	# Uses Profile Picture in their Profile
	# Uses Application for Ecommerce platform
	# Uses Android app
    # Uses ios app
    
    SELECT COUNT(HASPROFILEPICTURE) FROM USERS_DATA WHERE HASPROFILEPICTURE = "TRUE";
    SELECT COUNT(HASANYAPP) FROM USERS_DATA WHERE HASANYAPP ="TRUE";
    SELECT COUNT(HASANDROIDAPP) FROM USERS_DATA WHERE HASANDROIDAPP = "TRUE";
    SELECT COUNT(HASIOSAPP) FROM USERS_DATA WHERE HASIOSAPP = "TRUE";
    
#8.Calculate the total number of buyers for each country and sort the result 
# in descending order of total number of buyers.
SELECT COUNT(IDENTIFIERHASH),COUNTRY FROM USERS_DATA WHERE productsBought!=0 group by COUNTRY ORDER BY COUNT(IDENTIFIERHASH) DESC;
    
# 9. Calculate the TOTAL number of sellers for each country and sort the 
# result in ascending order of total number of sellers.
SELECT COUNT(IDENTIFIERHASH),COUNTRY   FROM USERS_DATA WHERE PRODUCTSSOLD!=0  group by COUNTRY  ORDER BY COUNT(IDENTIFIERHASH);

#10. Display name of top 10 countries having maximum products pass rate.
SELECT COUNTRY ,productsPassRate FROM USERS_DATA ORDER BY productsPassRate DESC LIMIT  10;

#11.Calculate the number of users on an ecommerce platform for different language choices.
SELECT COUNT(identifierHash),language, HASANYAPP FROM USERS_DATA WHERE HASANYAPP="TRUE" group by language;

#12. Check the choice of female users about putting the product in 
# a wishlist or to like socially on an ecommerce platform.
SELECT COUNT(PRODUCTSWISHED),COUNT(socialProductsLiked) FROM USERS_DATA  WHERE GENDER = "F" AND HASANYAPP="TRUE" AND (PRODUCTSWISHED !=0 OR socialProductsLiked !=0 );

# 13.Check the choice of male users about being seller or buyer.
SELECT COUNT(PRODUCTSSOLD),COUNT(PRODUCTSBOUGHT) FROM USERS_DATA WHERE GENDER = "M" AND  HASANYAPP="TRUE" AND (PRODUCTSSOLD !=0 OR PRODUCTSBOUGHT!=0);

# 14. Which country is having maximum number of buyers?
SELECT COUNTRY,PRODUCTSBOUGHT FROM USERS_DATA WHERE productsBought =(SELECT MAX(productsBought) FROM USERS_DATA);

#15.List the name of 10 countries having zero number of sellers.
SELECT COUNTRY ,productsSOLD FROM USERS_DATA WHERE productsSOLD=0 LIMIT 10;

#16.Display record of top 110 users who have used ecommerce platform recently
SELECT identifierHash,DAYSSINCELASTLOGIN,HASANYAPP FROM USERS_DATA WHERE HASANYAPP ='TRUE' ORDER BY DAYSSINCELASTLOGIN LIMIT 110;

#17.Calculate the number of female users those who have not logged in since last 100 days.
SELECT COUNT(GENDER) FROM USERS_DATA WHERE DAYSSINCELASTLOGIN >100 AND GENDER ="F";

#18.Display the number of female users of each country at ecommerce platform.
SELECT COUNT(identifierHash),GENDER,COUNTRY FROM USERS_DATA WHERE GENDER="F" AND HASANYAPP= "TRUE" GROUP BY COUNTRY;

#19. Display the number of male users of each country at ecommerce platform.
SELECT COUNT(identifierHash),GENDER,COUNTRY FROM USERS_DATA WHERE GENDER="m" AND HASANYAPP= "TRUE" GROUP BY COUNTRY;

#20 Calculate the average number of products sold and bought on ecommerce platform by male users for each country
SELECT AVG(productsSold),AVG(productsBought),GENDER,COUNTRY FROM USERS_DATA WHERE HASANYAPP= "TRUE" AND GENDER="m" GROUP BY COUNTRY;

