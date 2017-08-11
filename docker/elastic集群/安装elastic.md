##### 安装ik插件

```shell
# 因为我使用的是老版本的ES，所以ik插件也使用的是对应老版本的
$ git clone https://github.com/medcl/elasticsearch-analysis-ik
$ cd elasticsearch-analysis-ik
$ mvn clean
$ mvn compile
$ mvn package
$ cd target
$ cp elasticsearch-analysis-ik-xxx.jar ${ES_HOME}/plugins/ik/

$ cd elasticsearch-analysis-ik
$ cp config/ik ${ES_HOME}/config/12345678910111234567891011
```

##### 配置elasticsearch.yml文件，在文件的最后添加下面的配置

```yaml
index:
  analysis:
    analyzer:
      ik:
          alias: [ik_analyzer]
          type: org.elasticsearch.index.analysis.IkAnalyzerProvider
      ik_max_word:
          type: ik
          use_smart: false
      ik_smart:
          type: ik
          use_smart: true

index.analysis.analyzer.default.type: ik
index.store.type: niofs123456789101112131415123456789101112131415
```

##### 设置ES的内存大小

```
$ {ES_HOME}/bin
$ vi elasticsearch

# 设置ES的最大内存，最小内存
ES_MIN_MEM=4g
ES_MAX_MEM=4g
```