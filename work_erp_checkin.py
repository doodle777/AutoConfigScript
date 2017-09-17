#!/usr/bin/python3
# -*- coding:utf-8 -*-
## ERP自动打卡脚本

from http import cookiejar
from urllib import request as Req
from urllib import parse
import json


class Login:
    def __init__(self):
        self.username = ''
        self.password = ''
        self.code = ''
        self.login_url = 'http://ssa.jd.com/sso/login?ReturnUrl=http://erp.jd.com/'
        self.logout_url = 'http://erp.jd.com/logout'
        self.clock_info_url = 'http://erp.jd.com/portal/clock/clockInfo'
        self.check_in_url = 'http://kaoqin.jd.com/kaoqin/checkInJsonp'
        self.cookies = cookiejar.CookieJar()
        self.opener = Req.build_opener(Req.HTTPCookieProcessor(self.cookies))

    def init_cookie(self):
        request = Req.Request(url=self.login_url)
        response = self.opener.open(request)

    def login(self):
        data = parse.urlencode({
            'username': self.username,
            'password': self.password,
            'fp': self.code
        }).encode('ascii')

        request = Req.Request(url=self.login_url, data=data)
        response = self.opener.open(request)
        # result = response.read().decode('utf8')
        # print(result)

    def logout(self):
        request = Req.Request(url=self.logout_url)
        response = self.opener.open(request)
        result = response.read().decode('utf8')
        print(result)

    def get_clock(self):
        request = Req.Request(url=self.clock_info_url, method='POST')
        response = self.opener.open(request)
        clock = response.read().decode('utf8')
        return clock

    def check_in(self):
        clock = json.loads(self.get_clock())
        body = parse.urlencode({
            'tsDate': clock['data']['tsDate'],
            'tsDateDes': clock['data']['tsDateDes']
        }).encode('ascii')

        request = Req.Request(url=self.check_in_url, method='POST', data=body)
        response = self.opener.open(request)
        result = response.read().decode('utf8')
        print(result)

login = Login()
login.init_cookie()
login.login()
login.check_in()
