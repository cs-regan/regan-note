## php-fpm、cgi、fastCgi之间的区别与联系



### cgi 与 fastCgi

CGI 是 Web Server 与后台语言交互的协议，有了这个协议，开发者可以使用任何语言处理 Web Server 发来的请求，动态的生成内容。但 CGI 有一个致命的缺点，那就是每处理一个请求都需要 fork 一个全新的进程，随着 Web 的兴起，高并发越来越成为常态，这样低效的方式明显不能满足需求。就这样，FastCGI 诞生了，CGI 很快就退出了历史的舞台。

FastCGI，顾名思义为更快的 CGI，它允许在一个进程内处理多个请求，而不是一个请求处理完毕就直接结束进程，性能上有了很大的提高。

FastCGI像是一个常驻(long-live)型的CGI，它可以一直执行着，只要激活后，不会每次都要花费时间去fork一次（这是CGI最为人诟病的fork-and-execute 模式）。



### PHP-CGI

PHP-CGI是PHP自带的FastCGI管理器。

PHP-CGI的不足：

1. php-cgi变更php.ini配置后需重启php-cgi才能让新的php-ini生效，不可以平滑重启。
2. 直接杀死php-cgi进程，php就不能运行了。(PHP-FPM和Spawn-FCGI就没有这个问题，守护进程会平滑从新生成新的子进程。）



### PHP-FPM

PHP-FPM是一个PHP FastCGI管理器，是只用于PHP的，可以在 http://php-fpm.org/download下载得到

PHP-FPM其实是PHP源代码的一个补丁，旨在将FastCGI进程管理整合进PHP包中。必须将它patch到你的PHP源代码中，在编译安装PHP后才可以使用。

现在我们可以在最新的PHP 5.3.2的源码树里下载得到直接整合了PHP-FPM的分支，据说下个版本会融合进PHP的主分支去。相对Spawn-FCGI，PHP-FPM在CPU和内存方面的控制都更胜一筹，而且前者很容易崩溃，必须用crontab进行监控，而PHP-FPM则没有这种烦恼。

PHP5.3.3已经集成php-fpm了，不再是第三方的包了。PHP-FPM提供了更好的PHP进程管理方式，可以有效控制内存和进程、可以平滑重载PHP配置，比spawn-fcgi具有更多有点，所以被PHP官方收录了。在./configure的时候带 –enable-fpm参数即可开启PHP-FPM。

[Tag]: <tag>fpm</tag>