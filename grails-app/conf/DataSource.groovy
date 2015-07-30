dataSource {
	pooled = true
	driverClassName = "org.postgresql.Driver"
	dialect = org.hibernate.dialect.PostgreSQLDialect
	username = "postgres"
	password = "P0stgr3s"
}
hibernate {
	cache.use_second_level_cache=true
	cache.use_query_cache=true
	cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql://localhost:5432/auction"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:postgresql://localhost:5432/auctiondev"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:postgresql://localhost:5432/auction"
		}
	}
}
