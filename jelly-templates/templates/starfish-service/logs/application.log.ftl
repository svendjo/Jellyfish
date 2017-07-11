INFO  [2017-07-05 19:56:53,726] org.eclipse.jetty.util.log: Logging initialized @5995ms to org.eclipse.jetty.util.log.Slf4jLog
INFO  [2017-07-05 19:56:54,010] io.dropwizard.server.DefaultServerFactory: Registering jersey handler with root path prefix: /
INFO  [2017-07-05 19:56:54,016] io.dropwizard.server.DefaultServerFactory: Registering admin handler with root path prefix: /
INFO  [2017-07-05 19:56:54,018] io.dropwizard.assets.AssetsBundle: Registering AssetBundle with name: assets for path /assets/*
INFO  [2017-07-05 19:56:54,126] io.dropwizard.hibernate.SessionFactoryFactory: Entity classes: [com.example.helloworld.core.Person]
INFO  [2017-07-05 19:56:54,212] org.hibernate.dialect.Dialect: HHH000400: Using dialect: org.hibernate.dialect.H2Dialect
INFO  [2017-07-05 19:56:54,228] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.util.Currency] overrides previous : org.hibernate.type.CurrencyType@1649b0e6
INFO  [2017-07-05 19:56:54,228] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.Duration] overrides previous : org.hibernate.type.DurationType@55740540
INFO  [2017-07-05 19:56:54,229] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.Instant] overrides previous : org.hibernate.type.InstantType@50caa560
INFO  [2017-07-05 19:56:54,229] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.LocalDate] overrides previous : org.hibernate.type.LocalDateType@3943a2be
INFO  [2017-07-05 19:56:54,229] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.LocalDateTime] overrides previous : org.hibernate.type.LocalDateTimeType@45ca843
INFO  [2017-07-05 19:56:54,229] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.LocalTime] overrides previous : org.hibernate.type.LocalTimeType@dd0c991
INFO  [2017-07-05 19:56:54,230] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.OffsetDateTime] overrides previous : org.hibernate.type.OffsetDateTimeType@671a5887
INFO  [2017-07-05 19:56:54,230] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.OffsetTime] overrides previous : org.hibernate.type.OffsetTimeType@1356d4d4
INFO  [2017-07-05 19:56:54,230] org.hibernate.type.BasicTypeRegistry: HHH000270: Type registration [java.time.ZonedDateTime] overrides previous : org.hibernate.type.ZonedDateTimeType@6f27a732
INFO  [2017-07-05 19:56:54,235] org.hibernate.hql.internal.QueryTranslatorFactoryInitiator: HHH000397: Using ASTQueryTranslatorFactory
INFO  [2017-07-05 19:56:54,297] io.dropwizard.server.ServerFactory: Starting hello-world
                           web-scale hello world dP for the web
                                                 88
  .d8888b. dP.  .dP .d8888b. 88d8b.d8b. 88d888b. 88 .d8888b.
  88ooood8  `8bd8'  88'  `88 88'`88'`88 88'  `88 88 88ooood8
  88.  ...  .d88b.  88.  .88 88  88  88 88.  .88 88 88.  ...
  `88888P' dP'  `dP `88888P8 dP  dP  dP 88Y888P' dP `88888P'
                                        88
                                        dP

INFO  [2017-07-05 19:56:54,491] org.eclipse.jetty.setuid.SetUIDListener: Opened application@c67395{HTTP/1.1,[http/1.1]}{0.0.0.0:58459}
INFO  [2017-07-05 19:56:54,492] org.eclipse.jetty.setuid.SetUIDListener: Opened admin@5fc7255c{HTTP/1.1,[http/1.1]}{0.0.0.0:58460}
INFO  [2017-07-05 19:56:54,495] org.eclipse.jetty.server.Server: jetty-9.4.5.v20170502
INFO  [2017-07-05 19:56:55,639] io.dropwizard.jersey.DropwizardResourceConfig: The following paths were found for the configured resources:

    GET     /filtered/hello (com.example.helloworld.resources.FilteredResource)
    GET     /hello-world (com.example.helloworld.resources.HelloWorldResource)
    POST    /hello-world (com.example.helloworld.resources.HelloWorldResource)
    GET     /hello-world/date (com.example.helloworld.resources.HelloWorldResource)
    GET     /people (com.example.helloworld.resources.PeopleResource)
    POST    /people (com.example.helloworld.resources.PeopleResource)
    GET     /people/{personId} (com.example.helloworld.resources.PersonResource)
    GET     /people/{personId}/view_freemarker (com.example.helloworld.resources.PersonResource)
    GET     /people/{personId}/view_mustache (com.example.helloworld.resources.PersonResource)
    GET     /protected (com.example.helloworld.resources.ProtectedResource)
    GET     /protected/admin (com.example.helloworld.resources.ProtectedResource)
    GET     /views/iso88591.ftl (com.example.helloworld.resources.ViewResource)
    GET     /views/iso88591.mustache (com.example.helloworld.resources.ViewResource)
    GET     /views/utf8.ftl (com.example.helloworld.resources.ViewResource)
    GET     /views/utf8.mustache (com.example.helloworld.resources.ViewResource)

INFO  [2017-07-05 19:56:55,641] org.eclipse.jetty.server.handler.ContextHandler: Started i.d.j.MutableServletContextHandler@3cacc87{/,null,AVAILABLE}
INFO  [2017-07-05 19:56:55,645] io.dropwizard.setup.AdminEnvironment: tasks = 

    POST    /tasks/echo (com.example.helloworld.tasks.EchoTask)
    POST    /tasks/log-level (io.dropwizard.servlets.tasks.LogConfigurationTask)
    POST    /tasks/gc (io.dropwizard.servlets.tasks.GarbageCollectionTask)

INFO  [2017-07-05 19:56:55,656] org.eclipse.jetty.server.handler.ContextHandler: Started i.d.j.MutableServletContextHandler@56a9a7b5{/,null,AVAILABLE}
INFO  [2017-07-05 19:56:55,673] org.eclipse.jetty.server.AbstractConnector: Started application@c67395{HTTP/1.1,[http/1.1]}{0.0.0.0:58459}
INFO  [2017-07-05 19:56:55,674] org.eclipse.jetty.server.AbstractConnector: Started admin@5fc7255c{HTTP/1.1,[http/1.1]}{0.0.0.0:58460}
INFO  [2017-07-05 19:56:55,676] org.eclipse.jetty.server.Server: Started @7945ms
INFO  [2017-07-05 19:56:56,568] liquibase: Successfully acquired change log lock
INFO  [2017-07-05 19:56:57,775] liquibase: Creating database history table with name: PUBLIC.DATABASECHANGELOG
INFO  [2017-07-05 19:56:57,782] liquibase: Reading from PUBLIC.DATABASECHANGELOG
INFO  [2017-07-05 19:56:57,805] liquibase: migrations.xml: migrations.xml::1::codahale: Table people created
INFO  [2017-07-05 19:56:57,806] liquibase: migrations.xml: migrations.xml::1::codahale: ChangeSet migrations.xml::1::codahale ran successfully in 5ms
INFO  [2017-07-05 19:56:57,824] liquibase: Successfully released change log lock
INFO  [2017-07-05 19:56:58,277] org.hibernate.engine.internal.StatisticalLoggingSessionEventListener: Session Metrics {
    61766 nanoseconds spent acquiring 2 JDBC connections;
    40640 nanoseconds spent releasing 2 JDBC connections;
    7717854 nanoseconds spent preparing 1 JDBC statements;
    624579 nanoseconds spent executing 1 JDBC statements;
    0 nanoseconds spent executing 0 JDBC batches;
    0 nanoseconds spent performing 0 L2C puts;
    0 nanoseconds spent performing 0 L2C hits;
    0 nanoseconds spent performing 0 L2C misses;
    111711 nanoseconds spent executing 1 flushes (flushing a total of 1 entities and 0 collections);
    0 nanoseconds spent executing 0 partial-flushes (flushing a total of 0 entities and 0 collections)
}
INFO  [2017-07-05 19:56:58,342] org.eclipse.jetty.server.AbstractConnector: Stopped application@c67395{HTTP/1.1,[http/1.1]}{0.0.0.0:0}
INFO  [2017-07-05 19:56:58,345] org.eclipse.jetty.server.AbstractConnector: Stopped admin@5fc7255c{HTTP/1.1,[http/1.1]}{0.0.0.0:0}
INFO  [2017-07-05 19:56:58,348] org.eclipse.jetty.server.handler.ContextHandler: Stopped i.d.j.MutableServletContextHandler@56a9a7b5{/,null,UNAVAILABLE}
INFO  [2017-07-05 19:56:58,351] org.eclipse.jetty.server.handler.ContextHandler: Stopped i.d.j.MutableServletContextHandler@3cacc87{/,null,UNAVAILABLE}
