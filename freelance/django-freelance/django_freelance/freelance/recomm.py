def corr(x, y):
    """
    Корреляция двух векторов
    """
    n = len(x)
    avg_x = sum(x) / n
    avg_y = sum(y) / n

    a = sum([(x[i] - avg_x)*(y[i] - avg_y) for i in range(n)])
    b1 = sum([(x[i] - avg_x)**2 for i in range(n)])
    b2 = sum([(y[i] - avg_y)**2 for i in range(n)])
    return a / ((b1 * b2)**0.5)

def corrs(mtx, idx):
    """
    Массив корелляций
    """
    a = []
    for i in range(len(mtx)):
        if i == idx:
            a.append(None)
        else:
            a.append(corr(mtx[i], mtx[idx]))
    return a

def getRecomms(data, idx):
    """
    Возвращает номера рекомендаций в порядке убывания интересности
    """
    crs = corrs(data, idx)

    users = len(data)
    items = len(data[0])

    recomm = [0] * items
    interests = data[idx]

    for i in range(users):
        if crs[i] != None and crs[i] >= 0:
            for j in range(items):
                if interests[j] == 1:
                    recomm[j] += crs[i] * data[i][j]
    
    r = dict()

    for i in range(items):
        if interests[i] == 1:
            r[recomm[i]] = i
    r = list(r.values())
    return list(reversed(r))