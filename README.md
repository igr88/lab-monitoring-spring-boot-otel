# Generating traffic

```
docker run --rm -i grafana/k6:master-with-browser run - <./k6/dummy-load-generator.js
```

# References

* https://opentelemetry.io/docs/collector/installation/
* https://docs.spring.io/spring-boot/reference/actuator/tracing.html