module github.com/appleboy/gorush

go 1.12

require (
	github.com/apex/gateway v1.1.1
	github.com/appleboy/com v0.0.1
	github.com/appleboy/gin-status-api v1.0.2
	github.com/appleboy/go-fcm v0.1.4
	github.com/appleboy/gofight/v2 v2.1.1
	github.com/asdine/storm v2.1.2+incompatible
	github.com/buger/jsonparser v0.0.0-20181115193947-bf1c66bbce23
	github.com/dgraph-io/badger v1.5.5
	github.com/gin-gonic/gin v1.4.0
	github.com/go-logfmt/logfmt v0.4.0 // indirect
	github.com/golang/protobuf v1.3.1
	github.com/mattn/go-isatty v0.0.8
	github.com/mitchellh/mapstructure v1.1.2
	github.com/prometheus/client_golang v1.0.0
	github.com/sideshow/apns2 v0.19.0
	github.com/sirupsen/logrus v1.4.2
	github.com/spf13/viper v1.4.0
	github.com/stretchr/testify v1.3.0
	github.com/syndtr/goleveldb v1.0.0
	github.com/thoas/stats v0.0.0-20190407194641-965cb2de1678
	github.com/tidwall/btree v0.0.0-20191029221954-400434d76274 // indirect
	github.com/tidwall/buntdb v1.1.0
	github.com/tidwall/grect v0.0.0-20161006141115-ba9a043346eb // indirect
	github.com/tidwall/pretty v1.0.0 // indirect
	github.com/tidwall/rtree v0.0.0-20180113144539-6cd427091e0e // indirect
	github.com/tidwall/tinyqueue v0.0.0-20180302190814-1e39f5511563 // indirect
	github.com/ugorji/go v1.1.7 // indirect
	golang.org/x/crypto v0.0.0-20190617133340-57b3e21c3d56
	golang.org/x/net v0.0.0-20190613194153-d28f0bde5980
	golang.org/x/sync v0.0.0-20190423024810-112230192c58
	google.golang.org/grpc v1.21.1
	gopkg.in/redis.v5 v5.2.9
)

replace github.com/appleboy/go-fcm => github.com/anghami/go-fcm v0.1.5-0.20200116161218-d4732556ac44

replace github.com/appleboy/gorush => github.com/anghami/gorush v1.11.3-0.20200115203351-b36c309a0aa2
