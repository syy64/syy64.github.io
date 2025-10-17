create database grocery_analysis;
select * from grocery;
-- KPIs --
CREATE VIEW `KPI Summary` AS SELECT ROUND(SUM(`total sales`),2) AS total_sales, ROUND(AVG(`total sales`), 2) AS Average_Sales, COUNT(DISTINCTROW(`Item Identifier`)) AS number_of_items,
round(avg(`Rating`), 2) AS Average_Rating FROM grocery; 

CREATE VIEW `Sales By Fat Content` AS select `item fat content`, round(sum(`total sales`), 2) as total_sales from grocery group by `item fat content`;

CREATE VIEW `Fat Content KPI Analysis` AS select `item fat content`, round(avg(`total sales`), 2) as Average_sales,  round(avg(`rating`), 2) as Average_rating, 
count(distinctrow(`Item Identifier`)) as number_of_items from grocery group by `item fat content`;

CREATE VIEW `Sales By Item Type` AS select `item type`, round(sum(`total sales`),2) as total_sales from grocery group by `item type` order by total_sales desc; 

CREATE VIEW `Item Type KPI Analysis` AS select `item type`, round(avg(`total sales`), 2) as Average_sales,  round(avg(`rating`), 2) as Average_rating, 
count(distinctrow(`Item Identifier`)) as number_of_items from grocery group by `item type`;

select * from grocery;
CREATE VIEW `Sales By Outlet type Segemented by Fat Content` AS select `outlet type`, `item fat content`, 
round(sum(`total sales`),2) as total_sales from grocery group by `outlet type`, `item fat content` order by `Outlet Type`, `item fat content`;

CREATE VIEW `Fat Content & Outlet Type KPI Analysis` AS select `outlet type`, `item fat content`, round(avg(`total sales`), 2) as Average_sales,  round(avg(`rating`), 2) as Average_rating, 
count(distinctrow(`Item Identifier`)) as number_of_items from grocery group by `Outlet Type`, `Item Fat Content`;

CREATE VIEW  `Sales By Outlet Age` AS select distinct(`outlet identifier`) as outlet, year(curdate()) - `outlet establishment year` as age, round(sum(`total sales`),2) as total_sales from grocery 
group by outlet, age order by total_sales desc;

CREATE VIEW `Outlet Type KPI Analysis` AS select `outlet type`, round(avg(`total sales`), 2) as Average_sales,  round(avg(`rating`), 2) as Average_rating, 
count(distinctrow(`Item Identifier`)) as number_of_items from grocery group by `Outlet Type`;
