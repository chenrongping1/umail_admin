<template>
  <div>
   <el-table
      :data="list"
      style="width: 100%; margin-bottom: 10px"
      row-key="id"
      border
      :tree-props="{ children: 'children' }"
    >
      <el-table-column prop="id" label="用户编号" sortable width="180">
      </el-table-column>
      <el-table-column prop="nickname" label="用户昵称" sortable width="180">
      </el-table-column>

      <el-table-column prop="phone" label="手机号" sortable width="180">
      </el-table-column>

      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-button v-if="scope.row.status == 1" type="primary"
            >启用</el-button
          >
          <el-button v-else type="info">禁用</el-button>
        </template>
      </el-table-column>

      <el-table-column prop="status" label="操作" sortable width="180">
        <template slot-scope="scope">
          <el-button type="primary" @click="edit(scope.row.uid)"
            >编辑</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import {mapGetters,mapActions} from'vuex'
export default {
        computed:{
            ...mapGetters({
                list:'member/list'
            })
        },
        methods:{
            ...mapActions({
                reqLsit:'member/requestList'
            }),
            edit(uid){
                this.$emit('edit',uid)
            }
        },
        mounted(){
            this.reqLsit()
        }
}
</script>

<style>

</style>