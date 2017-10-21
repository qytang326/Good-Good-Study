#!/usr/bin/env python
# -*- coding: utf-8 -*-
import requests
from bs4 import BeautifulSoup

url = 'http://list.jd.com/list.html?cat=9987,653,655&page=1&delivery=1&trans=1&JL=4_21_0'
request = requests.get(url)
soup = BeautifulSoup(request.text, "html.parser")
items = soup.select('li.gl-item')
i = 1
for item in items:
    sku = item.find('div')['data-sku']
    price_url = 'http://p.3.cn/prices/mgets?skuIds=J_' + str(sku)
    price = requests.get(price_url).json()[0]['p']
    name = item.find('div', class_="p-name").find('em').string
    item_url = 'http:' + item.find('div', class_="p-name").find('a')['href']
    commit = item.find('div', class_="p-commit").find('a').string
    print("%d、\n 名称: %s \n 价格: %s 元 \n 评价: %s 个 \n 链接: %s" % (i, name, price, commit, item_url))
    if i >= 10:
        break
    else:
        i += 1
