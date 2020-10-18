<template>
  <el-table
    :data="list"
    style="width: 100%; margin-bottom: 10px"
    row-key="id"
    border
 
      :tree-props="{ children: 'children' }"
  >
    <el-table-column prop="id" label="菜单编号" sortable width="180">
    </el-table-column>
    <el-table-column prop="title" label="菜单名称" sortable width="180">
    </el-table-column>

    <el-table-column label="菜单图标" sortable width="180">
      <!--  -->
      <template slot-scope="scope">
        <i :class="scope.row.icon"></i>
      </template>
    </el-table-column>

    <el-table-column prop="url" label="菜单地址" sortable width="180">
    </el-table-column>
    <!--   <el-table-column prop="date" label="状态" sortable width="180">
             </el-table-column> -->

    <el-table-column label="状态">
      <template slot-scope="scope">
        <el-button v-if="scope.row.status == 1" type="primary">启用</el-button>
        <el-button v-else type="info">禁用</el-button>
      </template>
    </el-table-column>


    <el-table-column prop="status" label="操作" sortable width="180">
      <template slot-scope='scope'>
          <el-button type="primary" @click=edit(scope.row.id)>编辑</el-button>
          <del-btn @del=del(scope.row.id)></del-btn>
       <!--    <el-button type="danger">删除</el-button> -->
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import delBtn from '../../../components/del'
import { mapGetters, mapActions } from "vuex";
import {reqDelList} from '../../../untils/request'
import { warningAlert, successAlert } from "../../../untils/alert";
export default {
       components:{
       delBtn
    },
  data() {
    return {};
  },
  computed: {
    ...mapGetters({
      list: "list/list"
    })
  },
  methods: {
    ...mapActions({
      changeMenuList: "list/requestMenuList"
    }),
    edit(id){
      this.$emit('edit',id)
    },
  del(id){
     reqDelList(id).then((res) => {
            if (res.data.code == 200) {
              successAlert(res.data.msg);
              this.changeMenuList();
            } else {
              warningAlert(res.data.msg);
            }
          });
  }

  },

  mounted() {
    this.changeMenuList();
  }
};
</script>

<style scoped>
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}
.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
</style>
