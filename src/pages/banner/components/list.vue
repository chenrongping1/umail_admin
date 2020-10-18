<template>
  <el-table
    :data="list"
    style="width: 100%; margin-bottom: 10px"
    row-key="id"
    border
 
      :tree-props="{ children: 'children' }"
  >
    <el-table-column prop="id" label="轮播编号" sortable width="180">
    </el-table-column>
    <el-table-column prop="title" label="轮播名称" sortable width="180">
    </el-table-column>

 
<el-table-column label="图片">
      <template slot-scope="scope">
       <img :src="$imgUrl+scope.row.img" alt="" class="listImg">
      </template>
    </el-table-column>

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
import {reqBannerDel} from '../../../untils/request'
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
      list: "banner/list"
    })
  },
  methods: {
    ...mapActions({
      changeList: "banner/requestList"
    }),
    edit(id){
      this.$emit('edit',id)
    },
  del(id){
     reqBannerDel(id).then((res) => {
            if (res.data.code == 200) {
              successAlert(res.data.msg);
              this.changeList();
            } else {
              warningAlert(res.data.msg);
            }
          });
  }

  },

  mounted() {
    this.changeList();
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

.listImg{
  width: 150px;
  height: 150px;
}
</style>
