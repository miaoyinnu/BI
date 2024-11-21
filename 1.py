import random

# 假设 2022 年的 DateID 为 13 到 24
dates = list(range(13, 25))  # DateID 13 to 24

products = list(range(1, 11))  # ProductID 1 to 10
regions = list(range(1, 11))   # RegionID 1 to 10

for _ in range(500):
    product_id = random.choice(products)
    region_id = random.choice(regions)
    date_id = random.choice(dates)
    py_selling_revenue = round(random.uniform(1000.00, 50000.00), 2)

    print(f"INSERT INTO HistoricalSales (ProductID, RegionID, DateID, PY_SellingRevenue) VALUES ({product_id}, {region_id}, {date_id}, {py_selling_revenue});")

