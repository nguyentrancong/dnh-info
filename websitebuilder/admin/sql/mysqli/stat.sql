-- Stats

	-- get all stat 

	CREATE PROCEDURE getStats(
		-- variables
		IN  language_id INT,
		IN  site_id INT,
		IN 	post_id INT,
		IN 	user_id INT,
		
		-- interval
		IN 	start_date DATE,
		IN 	end_date DATE,

		-- return
		OUT fetch_all, -- orders
		OUT fetch_all  -- users
	)
	BEGIN
	
			-- orders

			SELECT COUNT(*) AS orders, DATE(created_at) as date FROM `order` AS orders
			
				LEFT JOIN order_status AS os ON (orders.order_status_id = os.order_status_id AND os.language_id = :language_id) 
				
			WHERE 1 = 1 
			
				AND orders.site_id = :site_id
				
				@IF isset(:order_status)
				THEN 
					AND os.name = :order_status
				END @IF		
				
				@IF isset(:start_date)
				THEN 
					AND DATE(orders.created_at) >= DATE(:start_date)
			
				END @IF	
				
				@IF isset(:end_date)
				THEN 
					AND DATE(orders.created_at) <= DATE(:end_date)
			
				END @IF					
				
			GROUP BY DATE(orders.created_at) ORDER BY date;
			
			
			-- users

			SELECT COUNT(*) AS users, DATE(created_at) as date FROM user AS users
			
			WHERE 1 = 1 
			
				@IF isset(:start_date)
				THEN 
					AND DATE(users.created_at) >= DATE(:start_date)
			
				END @IF	
				
				@IF isset(:end_date)
				THEN 
					AND DATE(users.created_at) <= DATE(:end_date)
			
				END @IF	
			
			GROUP BY DATE(created_at) ORDER BY date;			

	END
	
	CREATE PROCEDURE getOrdersCount(
		-- variables
		IN  language_id INT,
		IN  site_id INT,
		IN 	post_id INT,
		IN 	user_id INT,
		
		-- interval
		IN 	start_date DATE,
		IN 	end_date DATE,

		-- return
		-- OUT affected_rows,	-- sql mode
		OUT fetch_all, 		-- orders
		OUT fetch_all  		-- users
	)
	BEGIN
	
			-- orders
			
			-- SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

			SELECT COUNT(*) AS count, DATE(created_at) as date, os.name, orders.order_status_id, orders.order_status_id as array_key 
				FROM `order` AS orders
				LEFT JOIN order_status AS os ON (orders.order_status_id = os.order_status_id AND os.language_id = :language_id) 
				
			WHERE 1 = 1 
			
				AND orders.site_id = :site_id
				
				@IF isset(:order_status)
				THEN 
					AND os.name = :order_status
				END @IF		
				
				@IF isset(:start_date)
				THEN 
					AND DATE(orders.created_at) >= DATE(:start_date)
			
				END @IF	
				
				@IF isset(:end_date)
				THEN 
					AND DATE(orders.created_at) <= DATE(:end_date)
			
				END @IF					
			
			GROUP BY orders.order_status_id;		
	END

	CREATE PROCEDURE getCommentsCount(
		-- variables
		IN  language_id INT,
		IN  site_id INT,
		IN 	post_id INT,
		IN 	user_id INT,
		
		-- interval
		IN 	start_date DATE,
		IN 	end_date DATE,

		-- return
		OUT fetch_all -- comments
	)
	BEGIN
	
			-- comments

			SELECT COUNT(*) AS count, DATE(created_at) as date, comments.status, comments.status as array_key FROM comment AS comments
				
			WHERE 1 = 1 
			
				@IF isset(:status)
				THEN 
					AND comments.status = :status
				END @IF		
				
				@IF isset(:type)
				THEN 
					AND comments.type = :type
				END @IF		
				
				@IF isset(:start_date)
				THEN 
					AND DATE(comments.created_at) >= DATE(:start_date)
			
				END @IF	
				
				@IF isset(:end_date)
				THEN 
					AND DATE(comments.created_at) <= DATE(:end_date)
			
				END @IF					
			
			GROUP BY comments.status;		
	END
	
	
	CREATE PROCEDURE getReviewsCount(
		-- variables
		IN  language_id INT,
		IN  site_id INT,
		IN 	post_id INT,
		IN 	user_id INT,
		
		-- interval
		IN 	start_date DATE,
		IN 	end_date DATE,

		-- return
		OUT fetch_all -- reviews
	)
	BEGIN
	
			-- reviews

			SELECT COUNT(*) AS count, DATE(created_at) as date, reviews.status, reviews.status as array_key FROM product_review AS reviews
				
			WHERE 1 = 1 
			
				@IF isset(:status)
				THEN 
					AND reviews.status = :status
				END @IF		
				
				@IF isset(:type)
				THEN 
					AND reviews.type = :type
				END @IF		
				
				@IF isset(:start_date)
				THEN 
					AND DATE(reviews.created_at) >= DATE(:start_date)
			
				END @IF	
				
				@IF isset(:end_date)
				THEN 
					AND DATE(reviews.created_at) <= DATE(:end_date)
			
				END @IF					
			
			GROUP BY reviews.status;		
	END
	
	CREATE PROCEDURE getQuestionsCount(
		-- variables
		IN  language_id INT,
		IN  site_id INT,
		IN 	post_id INT,
		IN 	user_id INT,
		
		-- interval
		IN 	start_date DATE,
		IN 	end_date DATE,

		-- return
		OUT fetch_all -- questions
	)
	BEGIN
	
			-- questions

			SELECT COUNT(*) AS count, DATE(created_at) as date, questions.status, questions.status as array_key FROM product_question AS questions
				
			WHERE 1 = 1 
			
				@IF isset(:status)
				THEN 
					AND questions.status = :status
				END @IF		
				
				@IF isset(:type)
				THEN 
					AND questions.type = :type
				END @IF		
				
				@IF isset(:start_date)
				THEN 
					AND DATE(questions.created_at) >= DATE(:start_date)
			
				END @IF	
				
				@IF isset(:end_date)
				THEN 
					AND DATE(questions.created_at) <= DATE(:end_date)
			
				END @IF					
			
			GROUP BY questions.status;		
	END
	
	CREATE PROCEDURE getProductStockCount(
		-- variables
		IN  language_id INT,
		IN 	stock_status CHAR,
		
		-- interval
		IN 	start_date DATE,
		IN 	end_date DATE,

		-- return
		OUT fetch_all -- products
	)
	BEGIN
	
			-- products

			SELECT COUNT(*) AS count, products.stock_status_id, st.name as array_key FROM product AS products
			
				LEFT JOIN stock_status AS st ON (products.stock_status_id = st.stock_status_id AND st.language_id = :language_id) 
				
			WHERE 1 = 1 
			
				@IF isset(:stock_status)
				THEN 
					AND st.name = :stock_status
				END @IF		
				
				@IF isset(:start_date)
				THEN 
					AND DATE(products.created_at) >= DATE(:start_date)
			
				END @IF	
				
				@IF isset(:end_date)
				THEN 
					AND DATE(products.created_at) <= DATE(:end_date)
			
				END @IF					
				
			GROUP BY products.stock_status_id ORDER BY products.stock_status_id;
					
	END
