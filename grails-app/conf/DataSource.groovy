dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "avcpass"
    password = "avcpass"
   // dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    dialect = "org.hibernate.dialect.MySQL5Dialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://172.23.1.20:3306/avcpass?useUnicode=true&characterEncoding=UTF8"

        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://172.23.1.20:3306/avcpass?useUnicode=true&characterEncoding=UTF8"

        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://172.23.1.20:3306/avcpass?useUnicode=true&characterEncoding=UTF8"

        }
    }
}
