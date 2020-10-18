<template>
  <div>
    <el-table-column label="图片">
      <template slot-scope="scope">
        <img :src="$imgUrl + scope.row.img" alt="" class="listImg" />
      </template>
    </el-table-column>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>


.listImg{
  width: 150px;
  height: 150px;
}
</style>