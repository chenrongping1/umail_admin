<template>
  <div>
    <el-table
      :data="specsList"
      style="width: 100%; margin-bottom: 10px"
      row-key="id"
      border
      :tree-props="{ children: 'children' }"
    >
      <el-table-column prop="id" label="规格编号" sortable width="180">
      </el-table-column>
      <el-table-column prop="specsname" label="规格名称" sortable width="180">
      </el-table-column>

      <el-table-column prop="rolename" label="规格属性" sortable width="180">
        <template slot-scope="scope">
          <el-tag v-for='(item,index) in scope.row.attrs' :key='index'>{{item}}</el-tag>
          </template>
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
          <el-button type="primary" @click="edit(scope.row.id)"
            >编辑</el-button
          >
          <del-btn @del="del(scope.row.id)"></del-btn>
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
import {  reqSpecsDel} from "../../../untils/request";
import { warningAlert, successAlert } from "../../../untils/alert";
export default {
  data() {
    return {
    
    };
  },
  components: {
    delBtn,
  },
  computed: {
    ...mapGetters({
      specsList: "specs/list",
      total:'specs/total',
      size:'specs/size',
    }),
  },
  methods: {
    ...mapActions({
      reqSpecs: "specs/requestList",
      reqPage:'specs/changePage',
      reqCount:'specs/requestCount',
    }),
    edit(id) {
      this.$emit("edit", id);
    },
    del(id) {
      reqSpecsDel(id).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.reqSpecs();
          this.reqCount();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },

    changePage(e){
      this.reqPage(e);
    }
  },

  mounted() {
    this.reqSpecs();
    this.reqCount();
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
