<template>
  <div>
    <el-table
      :data="goodsList"
      style="width: 100%; margin-bottom: 10px"
      row-key="id"
      border
      :tree-props="{ children: 'children' }"
    >
      <el-table-column prop="id" label="商品编号" >
      </el-table-column>

      <el-table-column prop="goodsname" label="商品名称" sortable width="180">
      </el-table-column>

       <el-table-column prop="price" label="商品价格" >
         <template slot-scope="scope">
            <span>{{scope.row.price | filterPrice}}</span>
         </template>
      </el-table-column>

      <el-table-column prop="market_price" label="市场价格" >
              <template slot-scope="scope">
            <span>{{scope.row.market_price | filterPrice}}</span>
         </template>
      </el-table-column>

    <el-table-column label="图片">
      <template slot-scope="scope">
       <img :src="$imgUrl+scope.row.img" alt="" class="listImg">
      </template>
    </el-table-column>

      <el-table-column label="是否新品">
        <template slot-scope="scope">
          <el-button v-if="scope.row.isnew == 1" type="primary"
            >是</el-button
          >
          <el-button v-else type="info">否</el-button>
        </template>
      </el-table-column>

 <el-table-column label="是否热卖">
        <template slot-scope="scope">
          <el-button v-if="scope.row.ishot == 1" type="primary"
            >是</el-button
          >
          <el-button v-else type="info">否</el-button>
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
import {  reqGoodsDel} from "../../../untils/request";
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
      goodsList: "goods/list",
      total:'goods/total',
      size:'goods/size',
    }),
  },
  methods: {
    ...mapActions({
      reqgoods: "goods/requestList",
      reqPage:'goods/changePage',
      reqCount:'goods/requestCount',
    }),
    edit(id) {
      this.$emit("edit", id);
    },
    del(id) {
      reqGoodsDel(id).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.reqgoods();
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
    this.reqgoods();
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

.listImg{
  width: 80px;
  height: 80px;
}
</style>
