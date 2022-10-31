<template>
  <div>
    <el-button type="success" round @click="getIssues()">issue取得</el-button>
    <el-row :gutter="12">
      <TodoItem v-for="( issue, index ) in issues" :key="issue.id" :issue="issue.title" :index="index" @closeIssue="closeIssue"/>
    </el-row>
  </div>
</template>

<script>
import axios from 'axios';
import TodoItem from '@/components/TodoItem';

const client = axios.create({
  baseURL: `${process.env.VUE_APP_GITHUB_ENDPOINT}`,
  headers: {
    'Accept': 'application/vnd.github.v3+json',
    'Content-Type':'application/json',
    'Authorization': `token ${process.env.VUE_APP_GITHUB_TOKEN}`
  },
})

export default {
  name: 'IssueList',
  components: {
    TodoItem
  },
  data() {
    return {
      issues: [],
    }
  },
  methods: {
    getIssues() {
      client.get('/issues')
        .then((res) => {
          this.issues = res.data;
      })
    },
    closeIssue(index){
      const target = this.issues[index]
      client.patch(`/issues/${target.number}`,
          {
            state: 'closed'
          },
        )
        .then(() => {
          this.issues.splice(index, 1)
      })
    },
  },
  // created() {
  //   this.getIssues();
  // }
}
</script>