<!-- 修改搜索部分的代码 -->
<div class="search-box">
    <form action="search" method="get">
        <input type="text" name="keyword" class="search-input" placeholder="搜索商品...">
        <button type="submit" class="search-btn">搜索</button>
    </form>
</div>

<style>
    .search-box {
        display: flex;
        align-items: center;
    }
    .search-input {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px 0 0 4px;
        width: 200px; /* 调整宽度 */
    }
    .search-btn {
        padding: 8px 15px;
        background-color: #F07818;
        color: white;
        border: none;
        border-radius: 0 4px 4px 0;
        cursor: pointer;
    }
    .search-btn:hover {
        background-color: #e06c0f;
    }
</style>
