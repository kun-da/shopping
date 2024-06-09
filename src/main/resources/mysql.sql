-- 用户表
CREATE TABLE users (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(255) NOT NULL,
                       phone VARCHAR(20),
                       role VARCHAR(50) DEFAULT 'USER',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 商品表
CREATE TABLE products (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          description TEXT,
                          price DECIMAL(10, 2) NOT NULL,
                          stock INT NOT NULL,
                          category_id BIGINT,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- 分类表
CREATE TABLE categories (
                            id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            name VARCHAR(255) NOT NULL,
                            description TEXT,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 订单表
CREATE TABLE orders (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        user_id BIGINT,
                        total_amount DECIMAL(10, 2) NOT NULL,
                        status VARCHAR(50) NOT NULL,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 订单详情表
CREATE TABLE order_items (
                             id BIGINT AUTO_INCREMENT PRIMARY KEY,
                             order_id BIGINT,
                             product_id BIGINT,
                             quantity INT NOT NULL,
                             price DECIMAL(10, 2) NOT NULL,
                             total_price DECIMAL(10, 2) NOT NULL,
                             FOREIGN KEY (order_id) REFERENCES orders(id),
                             FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 购物车表
CREATE TABLE cart_items (
                            id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            user_id BIGINT,
                            product_id BIGINT,
                            quantity INT NOT NULL,
                            FOREIGN KEY (user_id) REFERENCES users(id),
                            FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 评论表
CREATE TABLE reviews (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         product_id BIGINT,
                         user_id BIGINT,
                         rating INT NOT NULL,
                         comment TEXT,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (product_id) REFERENCES products(id),
                         FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 优惠券表
CREATE TABLE coupons (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         code VARCHAR(50) NOT NULL,
                         discount DECIMAL(10, 2) NOT NULL,
                         expiration TIMESTAMP NOT NULL
);



# 插入初始数据

### 插入分类数据

INSERT INTO categories (name, description) VALUES
('电子产品', '各种电子产品'),
('食品饮料', '各种食品和饮料'),
('家居用品', '家庭生活用品'),
('服装鞋帽', '时尚服装和鞋帽'),
('运动户外', '运动和户外装备'),
('书籍', '各种书籍'),
('美容护肤', '美容和护肤品'),
('母婴用品', '母婴护理用品'),
('玩具', '儿童玩具'),
('汽车用品', '汽车相关用品');

### 插入商品数据


INSERT INTO products (name, description, price, stock, category_id) VALUES
('手机', '高性能智能手机', 3999.99, 100, (SELECT id FROM categories WHERE name='电子产品')),
('笔记本电脑', '便携式笔记本电脑', 6999.99, 50, (SELECT id FROM categories WHERE name='电子产品')),
('冰箱', '双门冰箱', 1999.99, 30, (SELECT id FROM categories WHERE name='家居用品')),
('洗衣机', '全自动洗衣机', 1599.99, 20, (SELECT id FROM categories WHERE name='家居用品')),
('啤酒', '冰爽啤酒', 9.99, 500, (SELECT id FROM categories WHERE name='食品饮料')),
('红酒', '高档红酒', 99.99, 200, (SELECT id FROM categories WHERE name='食品饮料')),
('T恤', '舒适的T恤', 49.99, 300, (SELECT id FROM categories WHERE name='服装鞋帽')),
('运动鞋', '轻便运动鞋', 299.99, 150, (SELECT id FROM categories WHERE name='运动户外')),
('小说', '畅销小说', 29.99, 400, (SELECT id FROM categories WHERE name='书籍')),
('护肤霜', '保湿护肤霜', 199.99, 250, (SELECT id FROM categories WHERE name='美容护肤'));


### 插入用户数据


INSERT INTO users (username, password, email, phone, role) VALUES
('zhangsan', 'password123', 'zhangsan@example.com', '13800000000', 'USER'),
('lisi', 'password456', 'lisi@example.com', '13900000000', 'ADMIN'),
('wangwu', 'password789', 'wangwu@example.com', '13700000000', 'USER'),
('zhaoliu', 'password101', 'zhaoliu@example.com', '13600000000', 'USER'),
('sunqi', 'password102', 'sunqi@example.com', '13500000000', 'USER'),
('liuba', 'password103', 'liuba@example.com', '13400000000', 'USER'),
('zhengjiu', 'password104', 'zhengjiu@example.com', '13300000000', 'USER'),
('hanqi', 'password105', 'hanqi@example.com', '13200000000', 'USER'),
('yangba', 'password106', 'yangba@example.com', '13100000000', 'USER'),
('chenjiu', 'password107', 'chenjiu@example.com', '13000000000', 'USER');


### 插入订单数据


INSERT INTO orders (user_id, total_amount, status) VALUES
((SELECT id FROM users WHERE username='zhangsan'), 4009.98, '已付款'),
((SELECT id FROM users WHERE username='lisi'), 19.98, '待付款'),
((SELECT id FROM users WHERE username='wangwu'), 1599.99, '已付款'),
((SELECT id FROM users WHERE username='zhaoliu'), 49.99, '已付款'),
((SELECT id FROM users WHERE username='sunqi'), 299.99, '待发货'),
((SELECT id FROM users WHERE username='liuba'), 99.99, '已发货'),
((SELECT id FROM users WHERE username='zhengjiu'), 29.99, '已完成'),
((SELECT id FROM users WHERE username='hanqi'), 3999.99, '已付款'),
((SELECT id FROM users WHERE username='yangba'), 99.98, '待付款'),
((SELECT id FROM users WHERE username='chenjiu'), 129.98, '已付款');


### 插入订单详情数据


INSERT INTO order_items (order_id, product_id, quantity, price, total_price) VALUES
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='zhangsan') AND total_amount=4009.98), (SELECT id FROM products WHERE name='手机'), 1, 3999.99, 3999.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='zhangsan') AND total_amount=4009.98), (SELECT id FROM products WHERE name='啤酒'), 1, 9.99, 9.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='lisi') AND total_amount=19.98), (SELECT id FROM products WHERE name='啤酒'), 2, 9.99, 19.98),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='wangwu') AND total_amount=1599.99), (SELECT id FROM products WHERE name='洗衣机'), 1, 1599.99, 1599.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='zhaoliu') AND total_amount=49.99), (SELECT id FROM products WHERE name='T恤'), 1, 49.99, 49.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='sunqi') AND total_amount=299.99), (SELECT id FROM products WHERE name='运动鞋'), 1, 299.99, 299.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='liuba') AND total_amount=99.99), (SELECT id FROM products WHERE name='红酒'), 1, 99.99, 99.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='zhengjiu') AND total_amount=29.99), (SELECT id FROM products WHERE name='小说'), 1, 29.99, 29.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='hanqi') AND total_amount=3999.99), (SELECT id FROM products WHERE name='手机'), 1, 3999.99, 3999.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='yangba') AND total_amount=99.98), (SELECT id FROM products WHERE name='啤酒'), 10, 9.99, 99.98),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='chenjiu') AND total_amount=129.98), (SELECT id FROM products WHERE name='护肤霜'), 1, 199.99, 199.99),
((SELECT id FROM orders WHERE user_id=(SELECT id FROM users WHERE username='chenjiu') AND total_amount=129.98), (SELECT id FROM products WHERE name='啤酒'), 3, 9.99, 29.97);


### 插入购物车数据


INSERT INTO cart_items (user_id, product_id, quantity) VALUES
((SELECT id FROM users WHERE username='zhangsan'), (SELECT id FROM products WHERE name='啤酒'), 5),
((SELECT id FROM users WHERE username='lisi'), (SELECT id FROM products WHERE name='手机'), 1),
((SELECT id FROM users WHERE username='wangwu'), (SELECT id FROM products WHERE name='护肤霜'), 2),
((SELECT id FROM users WHERE username='zhaoliu'), (SELECT id FROM products WHERE name='T恤'), 3),
((SELECT id FROM users WHERE username='sunqi'), (SELECT id FROM products WHERE name='运动鞋'), 1),
((SELECT id FROM users WHERE username='liuba'), (SELECT id FROM products WHERE name='红酒'), 4),
((SELECT id FROM users WHERE username='zhengjiu'), (SELECT id FROM products WHERE name='小说'), 1),
((SELECT id FROM users WHERE username='hanqi'), (SELECT id FROM products WHERE name='笔记本电脑'), 1),
((SELECT id FROM users WHERE username='yangba'), (SELECT id FROM products WHERE name='冰箱'), 1),
((SELECT id FROM users WHERE username='chenjiu'), (SELECT id FROM products WHERE name='护肤霜'), 1);


### 插入评论数据


INSERT INTO reviews (product_id, user_id, rating, comment) VALUES
((SELECT id FROM products WHERE name='手机'), (SELECT id FROM users WHERE username='zhangsan'), 5, '非常好用的手机！'),
((SELECT id FROM products WHERE name='啤酒'), (SELECT id FROM users WHERE username='lisi'), 4, '很爽口的啤酒！'),
((SELECT id FROM products WHERE name='护肤霜'), (SELECT id FROM users WHERE username='wangwu'), 3, '效果一般'),
((SELECT id FROM products WHERE name='T恤'), (SELECT id FROM users WHERE username='zhaoliu'), 5, '非常舒适的T恤！'),
((SELECT id FROM products WHERE name='运动鞋'), (SELECT id FROM users WHERE username='sunqi'), 4, '穿着很轻便'),
((SELECT id FROM products WHERE name='红酒'), (SELECT id FROM users WHERE username='liuba'), 5, '口感很好'),
((SELECT id FROM products WHERE name='小说'), (SELECT id FROM users WHERE username='zhengjiu'), 5, '非常好看的小说'),
((SELECT id FROM products WHERE name='笔记本电脑'), (SELECT id FROM users WHERE username='hanqi'), 4, '性能不错'),
((SELECT id FROM products WHERE name='冰箱'), (SELECT id FROM users WHERE username='yangba'), 3, '容量稍小'),
((SELECT id FROM products WHERE name='护肤霜'), (SELECT id FROM users WHERE username='chenjiu'), 4, '保湿效果好');


### 插入优惠券数据


INSERT INTO coupons (code, discount, expiration) VALUES
('DISCOUNT10', 10.00, '2024-12-31 23:59:59'),
('WELCOME20', 20.00, '2024-12-31 23:59:59'),
('SUMMER30', 30.00, '2024-08-31 23:59:59'),
('WINTER40', 40.00, '2024-12-31 23:59:59'),
('SPRING50', 50.00, '2024-03-31 23:59:59'),
('AUTUMN60', 60.00, '2024-11-30 23:59:59'),
('NEWUSER70', 70.00, '2024-12-31 23:59:59'),
('BLACKFRIDAY80', 80.00, '2024-11-29 23:59:59'),
('CYBERMONDAY90', 90.00, '2024-12-02 23:59:59'),
('CHRISTMAS100', 100.00, '2024-12-25 23:59:59');
