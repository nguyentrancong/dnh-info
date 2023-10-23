-- Product options

	-- get all product options

	PROCEDURE getAll(
		IN language_id INT,
		IN start INT,
		IN limit INT,
		OUT fetch_all, 
		OUT fetch_one,
	)
	BEGIN
		-- product_option
		SELECT product_option.*
			FROM product_option AS product_option
		
		WHERE 1 = 1
			
		-- limit
		@IF isset(:limit)
		THEN		
			@SQL_LIMIT(:start, :limit)
		END @IF;
		
		SELECT count(*) FROM (
			
			@SQL_COUNT(product_option.product_option_id, product_option) -- this takes previous query removes limit and replaces select columns with parameter product_id
			
		) as count;		
			
	END	
	
	-- get product option

	PROCEDURE get(
		IN product_option_id INT,
		OUT fetch_row, 
	)
	BEGIN
		-- product_option
		SELECT *
			FROM product_option as _ WHERE product_option_id = :product_option_id;
	END
	
	-- add product_option

	PROCEDURE add(
		IN product_option ARRAY,
		OUT insert_id
	)
	BEGIN
		
		-- allow only table fields and set defaults for missing values
		:product_option_data  = @FILTER(:product_option, product_option);
		
		
		INSERT INTO product_option 
			
			( @KEYS(:product_option_data) )
			
	  	VALUES ( :product_option_data );

	END
	
	-- edit product option

	CREATE PROCEDURE edit(
		IN product_option ARRAY,
		IN product_option_id INT,
		OUT affected_rows
	)
	BEGIN

		-- allow only table fields and set defaults for missing values
		@FILTER(:product_option, product_option);

		UPDATE product_option
			
			SET @LIST(:product_option) 
			
		WHERE product_option_id = :product_option_id


	END
	
	
	-- delete product option

	PROCEDURE delete(
		IN product_option_id ARRAY,
		OUT affected_rows, 
		OUT affected_rows, 
	)
	BEGIN
		DELETE FROM product_option_content WHERE product_option_id IN (:product_option_id);
		DELETE FROM product_option WHERE product_option_id IN (:product_option_id);
	END
