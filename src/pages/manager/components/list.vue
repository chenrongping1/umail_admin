<template>
  <div>
    <el-table
      :data="managerList"
      style="width: 100%; margin-bottom: 10px"
      row-key="id"
      border
      :tree-props="{ children: 'children' }"
    >
      <el-table-column prop="id" label="用户编号" sortable width="180">
      </el-table-column>
      <el-table-column prop="username" label="用户姓名" sortable width="180">
      </el-table-column>

      <el-table-column prop="rolename" label="用户角色" sortable width="180">
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
          <del-btn @del="del(scope.row.uid)"></del-btn>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination background layout="prev, pager, next" :total="total" :page-size='size' @current-change='changePage'>
    </el-pagination>
  </div>
</template>

<script>
import delBtn from "../../../components/del";
import { mapGetters, mapActions } from "vuex";
import { reqRoleDelList, reqUserDel} from "../../../untils/request";
import { warningAlert, successAlert } from "../../../untils/alert";
export default {
  data() {
    return {};
  },
  components: {
    delBtn,
  },
  computed: {
    ...mapGetters({
      list: "role/list",
      managerList: "manager/list",
      page:'manager/page',
      total:'manager/total',
      size:'manager/size',
    }),
  },
  methods: {
    ...mapActions({
      changeRoleList: "role/requestRoleList",
      changeUserList: "manager/requestUserList",
      changeUserPage:'manager/changeUserPage',
      changeUserCount:'manager/requestUserCount',
    }),
    edit(id) {
   
      this.$emit("edit", id);
    },
    del(uid) {
      reqUserDel(uid).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.changeUserList();
          this.changeUserCount();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },

    changePage(e){
      this.changeUserPage(e);
    }
  },

  mounted() {
    this.changeRoleList();
    this.changeUserList();
    this.changeUserCount();
  },
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
