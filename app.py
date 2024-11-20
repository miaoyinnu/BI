@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return render_template('dashboard.html', error='No file selected')

    file = request.files['file']
    if file.filename == '':
        return render_template('dashboard.html', error='No file selected')

    if file and file.filename.endswith('.csv'):
        filename = secure_filename(file.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)

        try:
            # 读取CSV文件并存入数据库
            df = pd.read_csv(filepath)
            conn = mysql.connector.connect(**db_config)
            cursor = conn.cursor()

            for _, row in df.iterrows():
                # 获取类别ID
                cursor.execute('SELECT id FROM clothing_categories WHERE category_name = %s',
                               (row['category'],))
                category = cursor.fetchone()
                if not category:
                    continue

                cursor.execute('''
                    INSERT INTO sales_data (date, category_id, quantity, unit_price)
                    VALUES (%s, %s, %s, %s)
                ''', (row['date'], category[0], row['quantity'], row['price']))

            conn.commit()
            cursor.close()
            conn.close()

            return render_template('dashboard.html', success='Data uploaded successfully')
        except Exception as e:
            return render_template('dashboard.html', error=f'Error processing file: {str(e)}')

    return render_template('dashboard.html', error='Invalid file type')