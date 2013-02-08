<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="shared" tagdir="/WEB-INF/tags"%>

<shared:header></shared:header>

<body>

	<shared:menu></shared:menu>

	<div class="container">
		<div class="row">
			<div class="span12">
				<h3>Products</h3>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<kendo:grid name="products" pageable="true">
					<kendo:grid-editable mode="popup"/>
					<kendo:grid-toolbar>
						<kendo:grid-toolbarItem name="create" />
					</kendo:grid-toolbar>
					<kendo:dataSource serverPaging="true" pageSize="10">
						<kendo:dataSource-transport>
							<kendo:dataSource-transport-read url="api/products"></kendo:dataSource-transport-read>
							<kendo:dataSource-transport-create url="api/products" type="POST"></kendo:dataSource-transport-create>
							<kendo:dataSource-transport-update url="api/products" type="POST"></kendo:dataSource-transport-update>
							<kendo:dataSource-transport-destroy url="api/products" type="DELETE"></kendo:dataSource-transport-destroy>
						</kendo:dataSource-transport>
						<kendo:dataSource-schema data="Data" total="Total">
							<kendo:dataSource-schema-model id="ProductID">
								<kendo:dataSource-schema-model-fields>
									<kendo:dataSource-schema-model-field name="ProductName">
										<kendo:dataSource-schema-model-field-validation required="true"/>
									</kendo:dataSource-schema-model-field>
									<kendo:dataSource-schema-model-field name="SupplierName"></kendo:dataSource-schema-model-field>
									<kendo:dataSource-schema-model-field name="CategoryName"></kendo:dataSource-schema-model-field>
									<kendo:dataSource-schema-model-field name="UnitPrice" type="number"></kendo:dataSource-schema-model-field>
									<kendo:dataSource-schema-model-field name="UnitsInStock" type="number"></kendo:dataSource-schema-model-field>
									<kendo:dataSource-schema-model-field name="Discontinued" type="boolean"></kendo:dataSource-schema-model-field>
								</kendo:dataSource-schema-model-fields>
							</kendo:dataSource-schema-model>
						</kendo:dataSource-schema>
					</kendo:dataSource>
					<kendo:grid-columns>
						<kendo:grid-column field="ProductName" title="Product"></kendo:grid-column>
						<kendo:grid-column field="SupplierID" title="Supplier" editor="supplierEditor" template="#: SupplierName #"></kendo:grid-column>
						<kendo:grid-column field="CategoryID" title="Category" width="150px" editor="categoryEditor" template="#: CategoryName #"></kendo:grid-column>
						<kendo:grid-column field="UnitPrice" title="Price" format="{0:c}" width="75px"></kendo:grid-column>
						<kendo:grid-column field="UnitsInStock" title="# In Stock" width="80px"></kendo:grid-column>
						<kendo:grid-column field="Discontinued" title="Discontinued" width="100px"></kendo:grid-column>
						<kendo:grid-column>
							<kendo:grid-column-command>
								<kendo:grid-column-commandItem name="edit"></kendo:grid-column-commandItem>
								<kendo:grid-column-commandItem name="destroy"></kendo:grid-column-commandItem>
							</kendo:grid-column-command>
						</kendo:grid-column>
					</kendo:grid-columns>
				</kendo:grid>
			</div>
		</div>
	</div>
	
	<script>
	
		function categoryEditor(container, options) {
			$("<input data-text-field='CategoryName' data-value-field='CategoryID' data-bind='value:" + options.field + "' />")
			.appendTo(container)
			.kendoDropDownList({
				dataSource: {
					transport: {
						read: "api/categories"
					}
				}
			});
		};
		
		function supplierEditor(container, options) {
			$("<input data-text-field='SupplierName' data-value-field='SupplierID' data-bind='value:" + options.field + "' />")
			.appendTo(container)
			.kendoDropDownList({
				dataSource: {
					transport: {
						read: "api/suppliers"
					}
				}
			});
		}
	
	</script>

</body>
</html>