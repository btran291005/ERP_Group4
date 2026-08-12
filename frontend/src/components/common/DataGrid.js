export default {
  name: 'DataGrid',
  props: {
    columns: { type: Array, required: true },  // [{ key: 'MaterialID', label: 'Material ID' }]
    rows:    { type: Array, required: true },
    loading: { type: Boolean, default: false },
  },
  template: `
    <div class="table-responsive">
      <table class="table table-sm table-hover align-middle">
        <thead class="table-light">
          <tr>
            <th v-for="col in columns" :key="col.key">{{ col.label }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-if="loading">
            <td :colspan="columns.length" class="text-center text-muted py-3">Loading...</td>
          </tr>
          <tr v-else-if="!rows.length">
            <td :colspan="columns.length" class="text-center text-muted py-3">No data</td>
          </tr>
          <tr v-for="(row, i) in rows" :key="i">
            <td v-for="col in columns" :key="col.key">{{ row[col.key] }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  `,
};
