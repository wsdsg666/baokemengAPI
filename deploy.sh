
#!/bin/bash

echo "🚀 正在部署宝可梦 API 项目..."

# 检查Docker和Docker Compose是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ 请先安装 Docker"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ 请先安装 Docker Compose"
    exit 1
fi

# 创建必要的目录
mkdir -p public/images/pokemon/{normal,mega,gmax,shiny}

# 构建并启动服务
docker-compose up -d --build

# 等待服务启动
echo "⏳ 等待服务启动..."
sleep 10

# 检查服务状态
if [ "$(docker-compose ps | grep -c "Up")" -eq 3 ]; then
    echo "✅ 部署完成！"
    echo "👉 FastAPI 文档地址：http://localhost:8000/docs"
    echo "👉 宝可梦图片地址：http://localhost:8000/static/images/pokemon"
else
    echo "❌ 部署失败，请检查日志"
    docker-compose logs
fi
