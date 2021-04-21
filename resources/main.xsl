<?xml version="1.0" encoding="UTF-8"?>
<!-- Шаблон формы -->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	version="1.0">

	<xsl:output
		media-type="application/xhtml+xml"
		method="xml"
		encoding="UTF-8"
		indent="yes"
		omit-xml-declaration="no"
		doctype-public="-//W3C//DTD XHTML 1.1//EN"
		doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />

	<xsl:strip-space elements="*" />

	<xsl:template match="/">
		<html xml:lang="ru">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Заявка</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
				<link rel="stylesheet" href="/resources/page.css"/>
			</head>
			<body>
			<div class="body px-3 pt-3">
				<form method="POST" action="/">
					<h5 class="mb-3">Заявитель: </h5>
					<input type="hidden" name="client" value="legal"/>
					<ul class="nav nav-tabs" id="clientTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="legal" data-toggle="tab" data-value-for="client" data-value="legal" href="#legal-content" role="tab" aria-controls="legal-content" aria-selected="true">Юридическое лицо</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="individual" data-toggle="tab" data-value-for="client" data-value="individual" href="#individual-content" role="tab" aria-controls="individual-content" aria-selected="false">Физическое лицо</a>
						</li>
					</ul>
					<div class="tab-content" id="clientTabContent">
						<div class="tab-pane fade show active" id="legal-content" role="tabpanel" aria-labelledby="legal-tab">
							<div class="form-header my-3"><b>Данные руководителя</b></div>
							<div class="form-group row">
								<label class="col-4">
									Имя
									<input type="text" name="legal-leader-name" class="form-control" placeholder="Имя руководителя"/>
								</label>
								<label class="col-4">
									Фамилия
									<input type="text" name="legal-leader-surname" class="form-control" placeholder="Фамилия руководителя"/>
								</label>
								<label class="col-4">
									Отчество
									<input type="text" name="legal-leader-thirdname" class="form-control" placeholder="Отчество руководителя"/>
								</label>
							</div>
							<div class="form-group row">
								<label class="col-4">
									ИНН
									<input type="text" class="form-control" name="legal-leader-inn" placeholder="ИНН руководителя"/>
								</label>
							</div>
							<div class="form-header my-3"><b>Данные организации</b></div>
							<div class="form-group row">
								<label for="legal-organization-name" class="col-3 col-form-label">Наименование</label>
								<div class="col-5">
									<input type="text" class="form-control" name="legal-organization-name" id="legal-organization-name" placeholder="Наименование организации"/>
								</div>
							</div>
							<div class="form-group row">
								<label for="legal-organization-address" class="col-3 col-form-label">Адрес</label>
								<div class="col-5">
									<input type="text" class="form-control" name="legal-organization-address" id="legal-organization-address" placeholder="Адрес организации"/>
								</div>
							</div>
							<div class="form-group row">
								<label for="legal-organization-ogrn" class="col-3 col-form-label">ОГРН</label>
								<div class="col-5">
									<input type="text" class="form-control" name="legal-organization-ogrn" id="legal-organization-ogrn" placeholder="ОГРН"/>
								</div>
							</div>
							<div class="form-group row">
								<label for="legal-organization-inn" class="col-3 col-form-label">ИНН</label>
								<div class="col-5">
									<input type="text" class="form-control" name="legal-organization-inn" id="legal-organization-inn" placeholder="ИНН"/>
								</div>
							</div>
							<div class="form-group row">
								<label for="legal-organization-kpp" class="col-3 col-form-label">КПП</label>
								<div class="col-5">
									<input type="text" class="form-control" name="legal-organization-kpp" id="legal-organization-kpp" placeholder="КПП"/>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="individual-content" role="tabpanel" aria-labelledby="individual-tab">...</div>
					</div>

					<h5 class="mb-3 mt-5">Выберите желаемый продукт: </h5>

					<input type="hidden" name="product" value="deposit"/>

					<ul class="nav nav-tabs" id="productTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="deposit" data-toggle="tab" data-value-for="product" data-value="deposit" href="#deposit-content" role="tab" aria-controls="deposit-content" aria-selected="true">Вклад</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="credit" data-toggle="tab" data-value-for="product" data-value="credit" href="#credit-content" role="tab" aria-controls="credit-content" aria-selected="false">Кредит</a>
						</li>
					</ul>
					<div class="tab-content" id="productTabContent">
						<div class="tab-pane fade show active" id="deposit-content" role="tabpanel" aria-labelledby="deposit-tab">
							<div class="form-header my-3"><b>Условия вклада</b></div>
							<div class="form-group row">
								<label for="deposit-period" class="col-3 col-form-label">Желаемый срок</label>
								<div class="col-5">
									<input type="number" class="form-control" name="deposit-period" id="deposit-period" placeholder="Количество месяцев"/>
								</div>
							</div>
							<div class="form-group row">
								<label for="deposit-bet" class="col-3 col-form-label">Ставка</label>
								<div class="col-5">
									<input type="text" class="form-control" name="deposit-bet" id="deposit-bet" placeholder="Ставка"/>
								</div>
							</div>
							<fieldset class="form-group">
								<div class="row">
									<legend class="col-form-label col-3 pt-0">Периодичность капитализации</legend>
									<div class="col-9">
										<div class="form-check">
											<label class="form-check-label">
												<input class="form-check-input" type="radio" name="deposit-period_type" value="month" checked=""/>
												Ежемесячно
											</label>
										</div>
										<div class="form-check">
											<label class="form-check-label">
												<input class="form-check-input" type="radio" name="deposit-period_type" value="end"/>
												В конце срока
											</label>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane fade" id="credit-content" role="tabpanel" aria-labelledby="credit-tab">...</div>
					</div>
					<button class="btn btn-primary mt-3 mb-4" type="submit">Отправить</button>
				</form>
			</div>
			</body>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
			<script src="/resources/page.js" ></script>
		</html>
	</xsl:template>
</xsl:stylesheet>
