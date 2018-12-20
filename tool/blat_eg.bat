@echo off
:::::::::::::: 参数设置::::::::::::::
set from=send_test@126.com【发送方地址】
set user=send_test【发送方账号】
set pass=123456【发送方密码】
set to=to_test@123.com【收件人】
set tf=mail_list.txt【收件人列表】
set subj=系统登录日志【邮件标题】
set mail=mail_body.txt【邮件内容】
set attach=D:\log.csv【邮件附件】
set server=smtp.126.com【发送服务器】
set debug=-debug -log blat.log -timestamp
::::::::::::::::: 运行blat :::::::::::::::::
blat %mail% -tf %tf% -base64 -charset Gb2312 -subject %subj% -attach "%attach%" -server %server% -f %from% -u %user% -pw %pass% %debug%
