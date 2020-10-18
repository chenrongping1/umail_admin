<template>
  <div>
    <el-table
      :data="list"
      style="width: 100%; margin-bottom: 10px"
      row-key="id"
      border
      :tree-props="{ children: 'children' }"
    >
      <el-table-column prop="title" label="活动名称" sortable width="180">
      </el-table-column>

      <el-table-column prop="begintime" label="开始时间" sortable width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.begintime | filterTime }}</span>
        </template>
      </el-table-column>

      <el-table-column prop="endtime" label="结束时间" sortable width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.endtime | filterTime }}</span>
        </template>
      </el-table-column>

      <el-table-column prop="endtime" label="活动状态" sortable width="180">
        <template slot-scope="scope">
          <div ref="end">{{ scope.row.date | filterEndTime }}</div>
        </template>
      </el-table-column>

      <!--     <el-table-column label="状态">
      <template slot-scope="scope">
        <el-button v-if="scope.row.status == 1" type="primary">启用</el-button>
        <el-button v-else type="info">禁用</el-button>
      </template>
    </el-table-column> -->

      <el-table-column prop="status" label="操作" sortable width="180">
        <template slot-scope="scope">
          <el-button type="primary" @click="edit(scope.row.id)">编辑</el-button>
          <del-btn @del="del(scope.row.id)"></del-btn>
          <!--    <el-button type="danger">删除</el-button> -->
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import delBtn from "../../../components/del";
import { mapGetters, mapActions } from "vuex";
import { reqSeckillDel } from "../../../untils/request";
import { warningAlert, successAlert } from "../../../untils/alert";
export default {
  components: {
    delBtn,
  },
  data() {
    return {};
  },
  computed: {
    ...mapGetters({
      list: "seckill/list",
    }),
    endTime() {
      let c = this.$refs.end;
      console.log("c", c);
      return 111;
    },
  },
  methods: {
    ...mapActions({
      changeList: "seckill/requestList",
    }),
    edit(id) {
      this.$emit("edit", id);
    },
    del(id) {
      reqSeckillDel(id).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.changeList();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
  },

  mounted() {
    this.changeList();
    const timer = window.setInterval(() => {
     this.changeList();
    }, 1000);
    this.$once("hook:beforeDestroy", ()=>{
      window.clearInterval(timer);
    });
    
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
