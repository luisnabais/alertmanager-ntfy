URL=http://localhost:8080


curl -X POST ${URL}/alert   -H "Content-Type: application/json"   -d '{"alerts":[{"annotations":{"summary":"Service down"}, "labels":{"severity":"critical"}, "status":"firing"}]}'

curl -X POST ${URL}/alert   -H "Content-Type: application/json"   -d '{"alerts":[{"annotations":{"summary":"Service recovered"}, "labels":{"severity":"critical"}, "status":"resolved"}]}'