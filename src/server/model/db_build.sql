BEGIN;

DROP TABLE IF EXISTS users, items, orders CASCADE;

CREATE TABLE users(
id SERIAL PRIMARY KEY,
full_name VARCHAR(50) UNIQUE NOT NULL,
mobile_number VARCHAR(100) UNIQUE NOT NULL,
password VARCHAR(100),
address TEXT,
till_number VARCHAR
);

CREATE TABLE items(
id SERIAL PRIMARY KEY,
title VARCHAR(100),
description TEXT,
image VARCHAR
);

CREATE TABLE orders(
id SERIAL PRIMARY KEY,
item_id INTEGER REFERENCES items(id),
user_id INTEGER REFERENCES users(id),
quantity INTEGER,
status VARCHAR,
delivery_date TIMESTAMP,
approved_date TIMESTAMP,
traking_number VARCHAR,
seen BOOLEAN DEFAULT false
);

insert into users(full_name, password, address, till_number, mobile_number)values('koko koko','$2b$10$QSlBaorIsHAilDaawqa2tuqq7RLfp5eUqevNNt8AviXd7H9WeFLTO','dcsdc','sddc', '+970567716309');


insert into items(title, description, image)values
('Panda','sas','http://www.supercutekawaii.com/wp-content/uploads/maqaroon.jpg' ),
('Start Necklace','sas','https://static.webshopapp.com/shops/064485/files/159239609/262x276x1/kaya-jewellery-cute-little-bracelet-for-kids-twink.jpg' ),
('Owl Necklace','sas','https://cdn.shopify.com/s/files/1/1048/0248/products/tb2tp9hafxxxxbdxpxxxxxxxxxx__136491545_grande.jpeg' ),
('Fish Necklace','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnv5ZnDGl8e_psgzqxwGMeIkWuhwefMnU-woLwj9xkU0YzJgQQSw' ),
('Red jewellery','sas','https://image.dhgate.com/0x0/f2/albu/g4/M00/45/F7/rBVaEFcl72KAFzj7AAEPzmi4Dqc408.jpg' ),
('Hat','sas','https://target.scene7.com/is/image/Target/52844504?wid=328&hei=328&qlt=80&fmt=pjpeg' ),
('Blue bracelet','sas','https://cdn.shopify.com/s/files/1/0255/2203/products/ps_2048x.png' ),
('Baby shoes','sas','https://pr.aopcdn.com/goods/16K06GSS01ZY/3062668_5.jpg' ),
('Medal','sas','https://img3.cohimg.net/is/image/Coach/27254_bke1l_a0?fmt=jpeg&wid=360&hei=452&qlt=80,0&op_sharpen=0&resMode=bicub&op_usm=5,0.2,0,0&iccEmbed=0&fit=vfit' ),
('Girly collar','sas','https://cdn.shopify.com/s/files/1/2494/3984/products/product-image-481481817_300x300.jpg?v=1510983013' ),
('Colorful','sas','https://www.thinkgeek.com/images/products/frontsquare/itkv_solar_orbit_necklace.jpg' ),
('Scarf','sas','https://www.jcrew.com/s7-img-facade/J9661_WX2343?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&wid=408&hei=408' ),
('White scarf','sas','http://images.selfridges.com/is/image/selfridges/485-3004860-518760730_SAND_M?$PLP_ALL$' ),
('Necklace','sas','https://gofilipino.com/uploads/ad_images/1528182575.jpg' ),
('Tree','sas','https://d5nkxbcmx4bo4.cloudfront.net/faceview/d3e/ff/h1i/a7b/affimgs/az-large-1785534.jpg' ),
('Oclock','sas','https://i.ytimg.com/vi/V1dr40-ovK4/hqdefault.jpg' ),
('Gift box','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT0IyAXeAkrmyIhBwqq1tM4eHDIp8Fs6XN-Ud5Kc7AOL1mpoW_' ),
('Flowers','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWT-Qqq9-WqR7u8ACPRnlDoALq10w1Y3qWkmvFcP4kxXlYUsFt2w' ),
('Flower collar','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGeRBvUAB_U7py24iA8AYi49Dbf0tXS-x4Fqnl2YRQI4cnL-2' ),
('Boy medal','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk2PHtBK5WvJV8c2gujXqpgTSXVoNaaWcQ5f295BbGEWHsI5TdLw' ),
('Bracelet','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmCKxYTprFUGoYN1D6FgUeV2zbpvq_4SyUgkgy4dKwazjTjvUD' ),
('Pink earing','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSac9VwTluw-XnyEyfpRpIH0IWm1JcC-4t8BKPrfT_Vi-Mr8cmM' ),
('Cat doll','sas','https://www.consciouscrafties.com/wp-content/uploads/2018/08/IRS20180806_113111-269x269.jpg' ),
('Bag','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaC4IrtjCWz9N6-AAiUZ8Z-CUr9OjDkDByq7dECpmRw8FcxfLLIg' ),
('Gift Box2','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsbcBXeAASHHqJA8x8crNeSsPIcz12fIcS8OKnJUYL0ToWy9Dc' ),
('Pink bracelet','sas','https://cf2.s3.souqcdn.com/item/2017/08/04/23/69/60/91/item_XL_23696091_34103599.jpg' ),
('Cute doll','sas','https://i.pinimg.com/736x/61/19/ac/6119ac68733c03ca99e257f45f890646--fabric-dolls-rag-dolls.jpg' ),
('Queen doll','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu5tlXXDaik4nJbLpK5V05Xa8JrwX2IvG_2ZWJ1CMHCwhzIdVklA' ),
('Doll','sas','https://i.ytimg.com/vi/wbJbii-wQbE/maxresdefault.jpg' ),
('China doll','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3Xz7lLa8UyGM0Pz6F_6hZ9-9sKkl3aJtQhNueqEYtVjWd-SUP' ),
('bracelet','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe9nOZPW05PGAtkCip22n_h6-3XULX_zRp2cKtZaWJ4SvmESZnDg' ),
('Earing','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuXvu_aVZbjzWpgRRyQUQwmHMfcc4cYKnPtyGqaxni6TuQRDlrfg' ),
('New bag','sas','https://4.imimg.com/data4/QE/BF/MY-24171809/girls-backpack-bags-500x500.jpg' ),
('Pika bag','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBxfoMEXImoc3MxQ3vyVGLSQ9GQ4Z944V3aFkaoIs7pwjy-jflRA' ),
('Cute bag','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGsS7Jy2eRRNaup5JE-HBBW7fkL2aa6DqWmzOsJAnAZfy90B_Cow' ),
('Brown bag','sas','https://images.anthropologie.com/is/image/Anthropologie/46560355_014_b?$an-category$&qlt=80&fit=constrain' ),
('Small bag','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpSR8Axs8CGPi5ei7bnqR0rIh3TY884PncaoF5akqWTwUgzv43' ),
('New bag','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtqb_KZlA5Kl1e3jMdTLsgT3M-MUyHwPGVHa7i7HB3FaH57TFncQ' ),
('Bag 3','sas','https://d1dq9tiesi76an.cloudfront.net/pub/media/catalog/product/cache/1/small_image/316x316/beff4985b56e3afdbeabfc89641a4582/0/0/005c_1_5.jpg' ),
('Baby bag','sas','https://www.thinkgeek.com/images/products/frontsquare/kshv_sw_porg_mini_backpack.jpg' ),
('Girlly bag','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEWmMmDSzd0ft1DNBEfz9h50dC0yJHJHQpHtqLbCmd8gRu6FMr' ),
('Hand made','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv1Pqw7RGtFlGUdrGl93aUQuEyrFXV-ow8Fnfrvf037b1a-xVuLA' ),
('New product','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDUX-_WrMY2uFLM-Kb2n8eD_0Jvu0XjP77b4hGL_xohP3DiZhz' ),
('New pshoes','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ7FdnNRUJZqXIiPij90MK-OSX7hJas3IrozWx-cSNoF4ggeSZ2w' ),
('New bag1','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-MNz41vHNVh7BHexmMC0CGwTUwHireBnaiwjtepJP1ZWac104cg' ),
('New gift','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXi4Ct4rR7DvvwxjF_XH3tPAFPlDSy13-bc0Wx1aNpZqtpiPqD' ),
('Flowers','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNTmgVTC9rHKdKqJnBHWsSalf5C-IWUeKdJRP7pIIWUMGkBURs' ),
('Chair','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnLoLX7jU-9Y5SvhwFKA8rNiCLxyvRoDLcwJSq3kMy_FkWekbv' ),
('Cub','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST-n4bhpZUbShSAFAix3sq9qMDFtcyH3Hc6jK248CzZsUltmXR' ),
('Owl','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJXxfw_nilG7tPKjcdcwCn3-gmtI1VH0GnhVqsZzCttCf45z0q' ),
('Gift box','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsV99Sdluujc5mpRkTVEgUZjkOpfGH6Js5X2krP5HDIVP57G_kBw' ),
('Bag4','sas','https://st.mngbcn.com/rcs/pics/static/T2/fotos/S20/23057677_08_D2.jpg?ts=1520606020857&imwidth=171&imdensity=1' ),
('flowers','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStEg0a6WMbfOU4A6SL0_YSPmPu9v64F_XgsJjAsw7Qf63nSxnQDQ' ),
('Bag5','sas','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgJjxwI00M_lir8N9iJjB3aMKX64Y1_GwKDL3YIUgCqeQv5Osq-g' ),
('flowers','sas','http://nrdesigns.org/wp-content/uploads/2018/07/handmade-wall-decor-attractive-decoration-pattern-for-decorations-4.jpg' );


insert into orders(item_id, user_id, quantity, status,  delivery_date)values
  (1,1,1,'Pending', '2018-08-17'),
  (2,1,1,'Pending','2018-08-16'),
  (3,1,1,'Delivered', '2018-08-15'),
  (4,1,1,'Pending', '2018-08-22'),
  (5,1,1,'Pending', '2018-08-22'),
  (6,1,1,'Delivered', '2018-08-22'),
  (7,1,1,'Pending', '2018-08-22'),
  (8,1,1,'Pending', '2018-08-22'),
  (9,1,1,'Delivered', '2018-08-22'),
  (9,1,1,'Delivered', '2018-08-22'),
  (10,1,1,'Pending', '2018-08-22'),
  (11,1,1,'Pending', '2018-08-22'),
  (12,1,1,'Delivered', '2018-08-22'),
  (13,1,1,'Delivered', '2018-08-22'),
  (14,1,1,'Pending', '2018-08-22'),
  (15,1,1,'Delivered', '2018-08-22'),
  (16,1,1,'Pending', '2018-08-22'),
  (17,1,1,'Pending', '2018-08-22'),
  (18,1,1,'Delivered', '2018-08-22'),
  (19,1,1,'Delivered', '2018-08-22'),
  (20,1,1,'Pending', '2018-08-22'),
  (21,1,1,'Delivered', '2018-08-22'),
  (22,1,1,'Delivered', '2018-08-22'),
  (23,1,1,'Pending', '2018-08-22'),
  (24,1,1,'Delivered', '2018-08-22'),
  (25,1,1,'Delivered', '2018-08-22'),
  (26,1,1,'Pending', '2018-08-22'),
  (27,1,1,'Delivered', '2018-08-22'),
  (28,1,1,'Delivered', '2018-08-22'),
  (29,1,1,'Pending', '2018-08-22'),
  (30,1,1,'Delivered', '2018-08-22'),
  (31,1,1,'Delivered', '2018-08-22'),
  (32,1,1,'Pending', '2018-08-22'),
  (33,1,1,'Delivered', '2018-08-22'),
  (34,1,1,'Delivered', '2018-08-22'),
  (35,1,1,'Pending', '2018-08-22'),
  (36,1,1,'Delivered', '2018-08-22'),
  (37,1,1,'Delivered', '2018-08-22'),
  (48,1,1,'Pending', '2018-08-22'),
  (39,1,1,'Delivered', '2018-08-22'),
  (40,1,1,'Delivered', '2018-08-22'),
  (41,1,1,'Pending', '2018-08-22'),
  (42,1,1,'Delivered', '2018-08-22'),
  (43,1,1,'Delivered', '2018-08-22'),
  (44,1,1,'Pending', '2018-08-22'),
  (45,1,1,'Delivered', '2018-08-22'),
  (46,1,1,'Delivered', '2018-08-22'),
  (47,1,1,'Pending', '2018-08-22'),
  (48,1,1,'Delivered', '2018-08-22'),
  (49,1,1,'Delivered', '2018-08-22'),
  (50,1,1,'Pending', '2018-08-22'),
  (51,1,1,'Delivered', '2018-08-22'),
  (52,1,1,'Delivered', '2018-08-22'),
  (53,1,1,'Pending', '2018-08-22'),
  (54,1,1,'Delivered', '2018-08-22'),
  (55,1,1,'Delivered', '2018-08-22'),
  (20,1,1,'Pending', '2018-08-22'),
  (25,1,1,'Delivered', '2018-08-22'),
  (30,1,1,'Delivered', '2018-08-22'),
  (35,1,1,'Pending', '2018-08-22'),
  (40,1,1,'Delivered', '2018-08-22'),
  (45,1,1,'Delivered', '2018-08-22'),
  (50,1,1,'Pending', '2018-08-22'),
  (55,1,1,'Delivered', '2018-08-22'),
  (21,1,1,'Delivered', '2018-08-22'),
  (31,1,1,'Pending', '2018-08-22'),
  (41,1,1,'Delivered', '2018-08-22'),
  (51,1,1,'Delivered', '2018-08-22'),
  (22,1,1,'Pending', '2018-08-22'),
  (32,1,1,'Delivered', '2018-08-22'),
  (42,1,1,'Delivered', '2018-08-22'),
  (52,1,1,'Pending', '2018-08-22'),
  (33,1,1,'Delivered', '2018-08-22'),
  (43,1,1,'Delivered', '2018-08-22'),
  (26,1,1,'Pending', '2018-08-22'),
  (46,1,1,'Delivered', '2018-08-22'),
  (37,1,1,'Delivered', '2018-08-22'),
  (24,1,1,'Pending', '2018-08-22'),
  (31,1,1,'Delivered', '2018-08-22'),
  (25,1,1,'Delivered', '2018-08-22');


COMMIT;
